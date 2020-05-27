import 'dart:async';
import 'dart:math';

import 'package:connectivity/connectivity.dart';
import 'package:eisenhower_matrix/models/ceil.dart';
import 'package:eisenhower_matrix/models/ceil_item.dart';
import 'package:eisenhower_matrix/models/matrix.dart';
import 'package:eisenhower_matrix/repository/abstract_matrix_local_repository.dart';
import 'package:eisenhower_matrix/repository/abstract_matrix_web_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class MatrixRepository {
  final _matrixStream = StreamController<Matrix>.broadcast();
  final MatrixLocalRepository matrixLocalRepository;
  final MatrixWebRepository matrixWebRepository;
  StreamSubscription<ConnectivityResult> _connectivityResultStream;
  var _internetAvailable = false;

  MatrixRepository({
    @required this.matrixLocalRepository,
    @required this.matrixWebRepository,
  }) : assert(matrixWebRepository != null && matrixLocalRepository != null) {
    matrixWebRepository.matrixStream
        .listen((matrixFromBackend) => _matrixStream.sink.add(matrixFromBackend));
    Connectivity().checkConnectivity().then(_onConnectionStateChanged);
    _connectivityResultStream =
        Connectivity().onConnectivityChanged.listen(_onConnectionStateChanged);
  }

  void _onConnectionStateChanged(ConnectivityResult connectivityResult) {
    if (_internetAvailable == false && connectivityResult != ConnectivityResult.none) {
      _internetAvailable = true;
      fetchMatrix();
    } else {
      _internetAvailable = connectivityResult != ConnectivityResult.none;
    }
  }

  /// Stream with the latest matrix state.
  /// After matrix state changing new state will be pushed here
  Stream<Matrix> get matrixStream => _matrixStream.stream;

  /// Create ceil item if it is doesn't exist else update existing item.
  /// Push new matrix state to the [matrixStream]
  Future<void> saveCeilItem(CeilItem item, CeilType ceilType) async {
    item = item.copyWith(id: _generateId(item.title));
    if (_internetAvailable) {
      try {
        final backendMatrix = await matrixWebRepository.saveCeilItem(item);
        final localMatrix = await matrixLocalRepository.saveCeilItem(item);
        await _synchronizeData(localMatrix: localMatrix, backendMatrix: backendMatrix);
      } catch (e) {
        debugPrint('Can not create or update ceil item $item. Exception: $e');
        final localMatrix = await matrixLocalRepository.saveCeilItem(item);
        await matrixLocalRepository.addUnSyncCeilItem(item.id);
        _matrixStream.sink.add(localMatrix);
      }
    } else {
      await matrixLocalRepository.addUnSyncCeilItem(item.id);
      final localMatrix = await matrixLocalRepository.saveCeilItem(item);
      _matrixStream.sink.add(localMatrix);
    }
  }

  /// Push new matrix state to the [matrixStream]
  Future<void> deleteCeilItem(String itemId, CeilType ceilType) async {
    if (_internetAvailable) {
      try {
        final backendMatrix = await matrixWebRepository.deleteCeilItem(itemId);
        final localMatrix = await matrixLocalRepository.deleteCeilItem(itemId);
        await _synchronizeData(localMatrix: localMatrix, backendMatrix: backendMatrix);
      } catch (e) {
        debugPrint('Can not delete ceil item with id = $itemId. Exception: $e');
        await matrixLocalRepository.addUnSyncDeletedCeilItem(itemId);
        final localMatrix = await matrixLocalRepository.deleteCeilItem(itemId);
        _matrixStream.sink.add(localMatrix);
      }
    } else {
      await matrixLocalRepository.addUnSyncDeletedCeilItem(itemId);
      final localMatrix = await matrixLocalRepository.deleteCeilItem(itemId);
      _matrixStream.sink.add(localMatrix);
    }
    final unSyncItems = await matrixLocalRepository.unSyncCeilItems;
    if (unSyncItems.contains(itemId)) {
      await matrixLocalRepository.deleteUnSyncCeilItem(itemId);
    }
  }

  /// Load last matrix state from both local and web repository.
  /// Push new matrix state to the [matrixStream]
  Future<void> fetchMatrix() async {
    final localMatrix = await matrixLocalRepository.fetchMatrix();
    _matrixStream.sink.add(localMatrix);
    if (_internetAvailable) {
      try {
        // if matrix on backend and device are different they will synchronize and
        await _synchronizeData(localMatrix: localMatrix);
      } catch (e) {
        debugPrint('Can not fetch matrix from backend. Exception: $e');
      }
    }
  }

  /// Try to sync data with local store and backend.
  /// [localMatrix] and [backendMatrix] must be fresh or not present.
  /// If they aren't present function will load it manually.
  /// Every functions should call it at the end of their work.
  /// If matrix on backend and device are different tey will be synchronized and added to a [matrixStream]
  Future<void> _synchronizeData({Matrix localMatrix, Matrix backendMatrix}) async {
    if (!_internetAvailable) {
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

    for (final backendCeilItem in backendCeilItems) {
      if (!localMatrix.allCeilItems.contains(backendCeilItem)) {
        localMatrix = await matrixLocalRepository.saveCeilItem(backendCeilItem);
      }
    }
  }

  void dispose() {
    _connectivityResultStream.cancel();
    _matrixStream.close();
    matrixWebRepository.dispose();
    matrixLocalRepository.dispose();
  }
}

String _generateId(String name) => '$name${Random().nextInt(pow(2, 31))}';
