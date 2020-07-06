import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eisenhower_matrix/models/ceil_item.dart';
import 'package:eisenhower_matrix/models/matrix.dart';
import 'package:eisenhower_matrix/models/models.dart';
import 'package:eisenhower_matrix/repository/abstract/matrix_web_repository.dart';
import 'package:eisenhower_matrix/repository/abstract/user_sign_in_repository.dart';
import 'package:eisenhower_matrix/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';

const _usersPath = 'users';
const _matrixPathName = 'matrix';
const _settingsPathName = 'settings';
const _ceilTypeName = 'CT';
const _titleName = 'TT';
const _indexName = 'IN';
const _urgentAndImportant = 'UI';
const _notUrgentAndImportant = 'NUI';
const _urgentAndNotImportant = 'UNI';
const _notUrgentAndNotImportant = 'NUNI';
const _isDone = 'DN';

/// Firebase implementation of [MatrixWebRepository]
/// Every functions must be called after user initialization
/// Works only with firebase implementations of [UserSignInRepository]
class FirebaseMatrixWebRepository extends MatrixWebRepository {
  final _matrixStream = StreamController<Matrix>.broadcast();
  final _db = Firestore.instance..settings(persistenceEnabled: false);
  bool _storageInitialized = false;
  final UserRepository userRepository;
  User _user;
  StreamSubscription<QuerySnapshot> _matrixStreamSubscription;

  FirebaseMatrixWebRepository({
    @required this.userRepository,
  }) : assert(userRepository != null) {
    userRepository.userStream.listen((user) => _user = user);
  }

  @override
  Stream<Matrix> get matrixStream => _matrixStream.stream;

  /// Throw [UserUnSigned] exception if the latest user in user repository is null
  @override
  Future<Matrix> fetchMatrix() async {
    try {
      await _ensureEveryThingInitialized();
    } on UserUnSigned catch (_) {
      rethrow;
    }
    await _matrixStreamSubscription?.cancel();
    _matrixStreamSubscription = _userMatrixCollectionRef.snapshots().listen(_matrixStreamListener);
    var userDocumentsSnapshot = await _userMatrixCollectionRef.getDocuments();
    return MatrixMap.fromDocumentsSnapshot(userDocumentsSnapshot.documents);
  }

  /// Throw [UserUnSigned] exception if the latest user in user repository is null
  @override
  Future<Matrix> deleteCeilItem(String itemId) async {
    try {
      await _ensureEveryThingInitialized();
    } on UserUnSigned catch (_) {
      rethrow;
    }
    await _userMatrixCollectionRef.document(itemId).delete();
    var userDocumentsSnapshot = await _userMatrixCollectionRef.getDocuments();
    return MatrixMap.fromDocumentsSnapshot(userDocumentsSnapshot.documents);
  }

  /// Throw [UserUnSigned] exception if the latest user in user repository is null
  @override
  Future<Matrix> saveCeilItem(CeilItem item) async {
    try {
      await _ensureEveryThingInitialized();
    } on UserUnSigned catch (_) {
      rethrow;
    }
    var itemMapEntry = item.toMapEntry();
    await _userMatrixCollectionRef.document(item.id).setData(itemMapEntry.value);
    var userDocumentsSnapshot = await _userMatrixCollectionRef.getDocuments();
    return MatrixMap.fromDocumentsSnapshot(userDocumentsSnapshot.documents);
  }

  /// Receive every changes in matrix, map them to [Matrix] and add to [matrixStream].
  void _matrixStreamListener(QuerySnapshot matrixSnapshot) {
    _matrixStream.sink.add(MatrixMap.fromDocumentsSnapshot(matrixSnapshot.documents));
  }

  /// Check is user (firestore) collection created and user is not null
  Future<void> _ensureEveryThingInitialized() async {
    if (_user == null) {
      throw UserUnSigned();
    }
    if (!_storageInitialized) {
      var documentSnapshot = await _userDocumentRef.get();
      if (!documentSnapshot.exists) {
        await _userDocumentRef.setData({
          _settingsPathName: {},
        });
        // I can't just create empty collection so i create and delete empty document
        await _userMatrixCollectionRef.document('emptyDocument').setData({});
        await _userMatrixCollectionRef.document('emptyDocument').delete();
      } else if (!documentSnapshot.data.containsKey(_settingsPathName)) {
        await _userDocumentRef.updateData({_matrixPathName: {}});
      }
    }
    _storageInitialized = true;
  }

  DocumentReference get _userDocumentRef => _db.collection(_usersPath).document(_user.id);

  CollectionReference get _userMatrixCollectionRef => _userDocumentRef.collection(_matrixPathName);

  @override
  Future<void> dispose() async {
    await _matrixStreamSubscription?.cancel();
    await _matrixStream.close();
  }
}

class UserUnSigned with Exception {}

extension MatrixMap on Matrix {
  static Matrix fromDocumentsSnapshot(List<DocumentSnapshot> documents) {
    final urgentImportant = <CeilItem>[];
    final notUrgentImportant = <CeilItem>[];
    final urgentNotImportant = <CeilItem>[];
    final notUrgentNotImportant = <CeilItem>[];
    for (final document in documents) {
      final ceilItem = CeilItemMap.fromMapEntry(MapEntry(document.documentID, document.data));
      switch (ceilItem.ceilType) {
        case CeilType.UrgentImportant:
          urgentImportant.add(ceilItem);
          break;
        case CeilType.UrgentNotImportant:
          urgentNotImportant.add(ceilItem);
          break;
        case CeilType.NotUrgentImportant:
          notUrgentImportant.add(ceilItem);
          break;
        case CeilType.NotUrgentNotImportant:
          notUrgentNotImportant.add(ceilItem);
          break;
      }
    }
    return Matrix(
      notUrgentAndNotImportant: Ceil(
        type: CeilType.NotUrgentNotImportant,
        items: notUrgentNotImportant,
      ),
      notUrgentAndImportant: Ceil(
        type: CeilType.NotUrgentImportant,
        items: notUrgentImportant,
      ),
      urgentAndImportant: Ceil(
        type: CeilType.UrgentImportant,
        items: urgentImportant,
      ),
      urgentAndNotImportant: Ceil(
        type: CeilType.UrgentNotImportant,
        items: urgentNotImportant,
      ),
    );
  }
}

extension CeilItemMap on CeilItem {
  MapEntry<String, dynamic> toMapEntry() => MapEntry(id, {
        _titleName: title,
        _ceilTypeName: () {
          switch (ceilType) {
            case CeilType.UrgentImportant:
              return _urgentAndImportant;
            case CeilType.UrgentNotImportant:
              return _urgentAndNotImportant;
            case CeilType.NotUrgentImportant:
              return _notUrgentAndImportant;
            case CeilType.NotUrgentNotImportant:
              return _notUrgentAndNotImportant;
            default:
              return '';
          }
        }(),
        _indexName: index,
        _isDone: done,
      });

  static CeilItem fromMapEntry(MapEntry<String, Map<String, dynamic>> entry) => CeilItem(
        id: entry.key,
        index: entry.value[_indexName],
        title: entry.value[_titleName],
        done: entry.value[_isDone] ?? false,
        ceilType: () {
          switch (entry.value[_ceilTypeName]) {
            case _urgentAndImportant:
              return CeilType.UrgentImportant;
            case _notUrgentAndImportant:
              return CeilType.NotUrgentImportant;
            case _urgentAndNotImportant:
              return CeilType.UrgentNotImportant;
            case _notUrgentAndNotImportant:
              return CeilType.NotUrgentNotImportant;
            default:
              return CeilType.UrgentImportant;
          }
        }(),
      );
}
