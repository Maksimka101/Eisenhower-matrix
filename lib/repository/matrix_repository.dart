import 'dart:async';

import 'package:eisenhower_matrix/models/models.dart';
import 'package:eisenhower_matrix/repository/abstract/matrix_local_repository.dart';
import 'package:eisenhower_matrix/repository/abstract/matrix_web_repository.dart';
import 'package:eisenhower_matrix/repository/user_repository.dart';
import 'package:eisenhower_matrix/utils/connection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class MatrixRepository {
  final _matrixStream = StreamController<Matrix>.broadcast();
  final MatrixLocalRepository matrixLocalRepository;
  final MatrixWebRepository matrixWebRepository;
  final UserRepository userRepository;
  final Connection connection;

  /// Function to generate unique id from ceil
  final String Function(CeilItem item) idGenerator;
  var _internetAvailable = false;
  User _user;

  MatrixRepository(
      {@required this.matrixLocalRepository,
      @required this.matrixWebRepository,
      @required this.userRepository,
      @required this.connection,
      this.idGenerator = defaultIdGenerator})
      : assert(matrixWebRepository != null &&
            matrixLocalRepository != null &&
            userRepository != null &&
            connection != null) {
    connection.connectedToTheInternet.then(_onConnectionStateChanged);

    userRepository.userStream.listen((user) {
      _user = user;
      if (_user != null && _user.signInProvider != SignInProvider.Anonymous) {
        matrixWebRepository.matrixStream
            .listen((matrixFromBackend) => _matrixStream.sink.add(matrixFromBackend));
        connection.connectionChanges.listen(_onConnectionStateChanged);
      }
    });
  }

  void _onConnectionStateChanged(bool connected) {
    if (connected) {
      fetchMatrix();
    }
    _internetAvailable = connected;
  }

  /// Stream with the latest matrix state.
  /// After matrix state changing new state will be pushed here
  Stream<Matrix> get matrixStream => _matrixStream.stream;

  /// Create ceil item if it is doesn't exist else update existing item.
  /// Push new matrix state to the [matrixStream]
  Future<void> saveCeilItem(CeilItem item) async {
    item = item.copyWith(id: idGenerator(item));
    final localMatrix = await matrixLocalRepository.saveCeilItem(item);
    await matrixLocalRepository.addUnSyncCeilItem(item.id);
    if (_user != null && _user.signInProvider != SignInProvider.Anonymous) {
      if (_internetAvailable) {
        try {
          final backendMatrix = await matrixWebRepository.saveCeilItem(item);
          await matrixLocalRepository.deleteUnSyncCeilItem(item.id);
          await _synchronizeData(localMatrix: localMatrix, backendMatrix: backendMatrix);
        } catch (e) {
          debugPrint('Can not create or update ceil item $item. Exception: $e');
          _matrixStream.sink.add(localMatrix);
        }
      } else {
        _matrixStream.sink.add(localMatrix);
      }
    } else {
      _matrixStream.sink.add(localMatrix);
    }
  }

  /// Push new matrix state to the [matrixStream]
  Future<void> deleteCeilItem(String itemId) async {
    await matrixLocalRepository.addUnSyncDeletedCeilItem(itemId);
    final localMatrix = await matrixLocalRepository.deleteCeilItem(itemId);
    if (_user != null && _user.signInProvider != SignInProvider.Anonymous) {
      if (_internetAvailable) {
        try {
          final backendMatrix = await matrixWebRepository.deleteCeilItem(itemId);
          await matrixLocalRepository.deleteUnSyncDeletedCeilItem(itemId);
          await _synchronizeData(localMatrix: localMatrix, backendMatrix: backendMatrix);
        } catch (e) {
          debugPrint('Can not delete ceil item with id = $itemId. Exception: $e');
          _matrixStream.sink.add(localMatrix);
        }
      } else {
        _matrixStream.sink.add(localMatrix);
      }
      final unSyncItems = await matrixLocalRepository.unSyncCeilItems;
      if (unSyncItems.contains(itemId)) {
        await matrixLocalRepository.deleteUnSyncCeilItem(itemId);
      }
    } else {
      _matrixStream.sink.add(localMatrix);
    }
  }

  /// Load last matrix state from both local and web repository.
  /// Push new matrix state to the [matrixStream]
  Future<void> fetchMatrix() async {
    final localMatrix = await matrixLocalRepository.fetchMatrix();
    _matrixStream.sink.add(localMatrix);
    if (_user != null && _user.signInProvider != SignInProvider.Anonymous) {
      if (_internetAvailable) {
        try {
          // if matrix on backend and device are different they will synchronize and
          await _synchronizeData(localMatrix: localMatrix);
        } catch (e) {
          debugPrint('Can not fetch matrix from backend. Exception: $e');
        }
      }
    }
  }

  /// Try to sync data with local store and backend.
  /// [localMatrix] and [backendMatrix] must be fresh or not present.
  /// If they aren't present function will load it manually.
  /// Every functions should call it at the end of their work.
  /// If matrix on backend and device are different tey will be synchronized and added to a [matrixStream]
  Future<void> _synchronizeData({Matrix localMatrix, Matrix backendMatrix}) async {
    if (!_internetAvailable || _user != null && _user.signInProvider == SignInProvider.Anonymous) {
      return;
    }
    localMatrix ??= await matrixLocalRepository.fetchMatrix();
    backendMatrix ??= await matrixWebRepository.fetchMatrix();
    final backendCeilItems = backendMatrix.allCeilItems;

    final deleted = await matrixLocalRepository.unSyncDeletedCeilItems;

    for (final deletedId in deleted) {
      final deletedItemExist = backendMatrix.allCeilItems.any((element) => element.id == deletedId);
      if (deletedItemExist) {
        try {
          backendCeilItems.removeWhere((element) => element.id == deletedId);
          await matrixWebRepository.deleteCeilItem(deletedId);
          await matrixLocalRepository.deleteUnSyncDeletedCeilItem(deletedId);
        } catch (e) {
          debugPrint('Can not sync deleted item with backend. Exception: $e');
        }
      }
    }

    final created = await matrixLocalRepository.unSyncCeilItems;

    for (final createdId in created) {
      final createdDoesNotExist =
          !backendMatrix.allCeilItems.any((element) => element.id == createdId);
      if (createdDoesNotExist) {
        try {
          final item = localMatrix.allCeilItems
              .firstWhere((element) => element.id == createdId, orElse: () => null);
          if (item == null) {
            debugPrint('Unsynchronized item has been deleted');
            continue;
          }
          backendCeilItems.add(item);
          await matrixWebRepository.saveCeilItem(item);
          await matrixLocalRepository.deleteUnSyncCeilItem(createdId);
        } catch (e) {
          debugPrint('Can not sync created matrix with backend. Exception: $e');
        }
      }
    }

    var localIds = localMatrix.allCeilItems.map((e) => e.id).toList();
    for (final backendCeilItem in backendCeilItems) {
      if (!localIds.contains(backendCeilItem.id)) {
        localMatrix = await matrixLocalRepository.saveCeilItem(backendCeilItem);
      }
    }
  }

  void dispose() {
    _matrixStream.close();
    matrixWebRepository.dispose();
    matrixLocalRepository.dispose();
  }
}

String defaultIdGenerator(CeilItem item) => '${item.hashCode}';
//    '${name.length > 9 ? name.substring(0, 10) : name}${Random().nextInt(pow(2, 31))}';
