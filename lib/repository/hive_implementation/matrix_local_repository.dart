import 'package:eisenhower_matrix/models/ceil_item.dart';
import 'package:eisenhower_matrix/models/matrix.dart';
import 'package:eisenhower_matrix/repository/abstract/matrix_local_repository.dart';
import 'package:eisenhower_matrix/repository/hive_implementation/ceil_item.dart';
import 'package:eisenhower_matrix/utils/hive_utils.dart';

class HiveMatrixLocalRepository extends MatrixLocalRepository {
  static const _unSyncCeilItemsBoxName = 'USCIBN';
  static const _unSyncDeletedCeilItemBoxName = 'USDCIBN';
  static const _ceilItemsBoxName = 'CIBN';

  @override
  Future<void> addUnSyncCeilItem(String itemId) async {
    var box = await HiveUtils.getBox<String>(_unSyncCeilItemsBoxName);
    await box.put(itemId, itemId);
  }

  @override
  Future<void> addUnSyncDeletedCeilItem(String itemId) async {
    var box = await HiveUtils.getBox<String>(_unSyncDeletedCeilItemBoxName);
    assert(box.keys.contains(itemId));
    await box.put(itemId, itemId);
  }

  @override
  Future<Matrix> deleteCeilItem(String itemId) async {
    var box = await HiveUtils.getBox<HiveCeilItem>(_ceilItemsBoxName);
    assert(box.keys.contains(itemId));
    await box.delete(itemId);
    return fetchMatrix();
  }

  @override
  Future<void> deleteUnSyncCeilItem(String itemId) async {
    var box = await HiveUtils.getBox<String>(_unSyncCeilItemsBoxName);
    assert(box.keys.contains(itemId));
    await box.delete(itemId);
  }

  @override
  Future<void> deleteUnSyncDeletedCeilItem(String itemId) async {
    var box = await HiveUtils.getBox<String>(_unSyncDeletedCeilItemBoxName);
    assert(box.keys.contains(itemId));
    await box.delete(itemId);
  }

  @override
  Future<Matrix> fetchMatrix() async {
    var box = await HiveUtils.getBox<HiveCeilItem>(_ceilItemsBoxName);
    return Matrix.fromCeilItems(
        box.values.map<CeilItem>((hiveItem) => hiveItem.toCeilItem()).toList());
  }

  @override
  Future<Matrix> saveCeilItem(CeilItem item) async {
    var box = await HiveUtils.getBox<HiveCeilItem>(_ceilItemsBoxName);
    await box.put(item.id, HiveCeilItem.fromCeilItem(item));
    return fetchMatrix();
  }

  @override
  Future<List<String>> get unSyncCeilItems async =>
      (await HiveUtils.getBox<String>(_unSyncCeilItemsBoxName)).values.toList();

  @override
  Future<List<String>> get unSyncDeletedCeilItems async =>
      (await HiveUtils.getBox<String>(_unSyncDeletedCeilItemBoxName)).values.toList();

  @override
  Future<void> dispose() async {}
}
