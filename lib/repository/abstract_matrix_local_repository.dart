import 'package:eisenhower_matrix/models/ceil_item.dart';
import 'package:eisenhower_matrix/models/matrix.dart';

/// Used to cache data in local storage
abstract class MatrixLocalRepository {
  /// Load matrix from device
  Future<Matrix> fetchMatrix();

  /// Create ceil item if id is null else update existing item
  /// On success return matrix state and ceil id
  Future<Matrix> saveCeilItem(CeilItem item);

  /// On success return matrix state
  Future<Matrix> deleteCeilItem(String itemId);

  /// Store matrix ceil item ids which isn't synchronized with backend
  /// Used for synchronization
  Future<List<String>> get unSyncCeilItems;

  Future<void> addUnSyncCeilItem(String itemId);

  Future<void> deleteUnSyncCeilItem(String itemId);

  /// Store matrix ceil item ids which deleted on device bun not at backend
  Future<List<String>> get unSyncDeletedCeilItems;

  Future<void> addUnSyncDeletedCeilItem(String itemId);

  Future<void> deleteUnSyncDeletedCeilItem(String itemId);

  /// Free all resources
  Future<void> dispose();
}