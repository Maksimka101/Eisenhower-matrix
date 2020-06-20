import 'package:eisenhower_matrix/models/models.dart';
import 'package:eisenhower_matrix/repository/abstract/matrix_local_repository.dart';
import 'package:flutter/cupertino.dart';

class MockMatrixLocalRepository extends MatrixLocalRepository {
  final List<String> unSyncCeilItem;
  final List<String> unSyncDeletedCeilItem;
  Matrix matrix;

  MockMatrixLocalRepository({
    this.unSyncCeilItem = const [],
    this.unSyncDeletedCeilItem = const [],
    @required this.matrix,
  });

  @override
  Future<void> addUnSyncCeilItem(String itemId) async {
    unSyncCeilItem.add(itemId);
  }

  @override
  Future<void> addUnSyncDeletedCeilItem(String itemId) async {
    unSyncDeletedCeilItem.add(itemId);
  }

  @override
  Future<Matrix> deleteCeilItem(String itemId) async {
    matrix =
        Matrix.fromCeilItems(matrix.allCeilItems..removeWhere((element) => element.id == itemId));
    return matrix;
  }

  @override
  Future<void> deleteUnSyncCeilItem(String itemId) async {
    unSyncCeilItem.remove(itemId);
  }

  @override
  Future<void> deleteUnSyncDeletedCeilItem(String itemId) async {
    unSyncDeletedCeilItem.remove(itemId);
  }

  @override
  Future<void> dispose() async {}

  @override
  Future<Matrix> fetchMatrix() async {
    return matrix;
  }

  @override
  Future<Matrix> saveCeilItem(CeilItem item) async {
    matrix = Matrix.fromCeilItems(matrix.allCeilItems..add(item));
    return matrix;
  }

  @override
  Future<List<String>> get unSyncCeilItems async => unSyncCeilItem;

  @override
  Future<List<String>> get unSyncDeletedCeilItems async => unSyncDeletedCeilItem;
}
