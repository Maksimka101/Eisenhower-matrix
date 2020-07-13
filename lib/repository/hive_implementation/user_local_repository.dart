import 'package:eisenhower_matrix/models/models.dart';
import 'package:eisenhower_matrix/models/user.dart';
import 'package:eisenhower_matrix/repository/abstract/user_local_repository.dart';
import 'package:eisenhower_matrix/utils/hive_utils.dart';

class HiveUserLocalRepository extends UserLocalRepository {
  @override
  Future<User> fetchUser() async {
    var userBox = await HiveUtils.getBox<User>(HiveUtils.userBoxName);
    final user = userBox.get(HiveUtils.userBoxName);
    return user;
  }

  @override
  Future<bool> get isSignOutSynchronized async {
    var box = await HiveUtils.getBox<bool>(HiveUtils.signOutSyncedBox);
    return box.get(HiveUtils.signOutSyncedBox) ?? true;
  }

  @override
  Future<User> saveUser(User user) async {
    var userBox = await HiveUtils.getBox<User>(HiveUtils.userBoxName);
    await userBox.put(HiveUtils.userBoxName, user);
    await userBox.compact();
    return user;
  }

  @override
  Future<void> signOut() async {
    var userBox = await HiveUtils.getBox<User>(HiveUtils.userBoxName);
    await userBox.put(
      HiveUtils.userBoxName,
      null,
    );
    await eraseStorage();
  }

  @override
  Future<void> signOutSynchronized(bool synchronized) async {
    var userBox = await HiveUtils.getBox<bool>(HiveUtils.signOutSyncedBox);
    await userBox.put(HiveUtils.signOutSyncedBox, synchronized);
  }

  /// For internal usage
  @override
  Future<void> eraseStorage() async {
    var itemsBox = await HiveUtils.getBox<CeilItem>(HiveUtils.ceilItemsBoxName);
    await itemsBox.clear();
    var userBox = await HiveUtils.getBox<User>(HiveUtils.userBoxName);
    await userBox.clear();
    var unSyncDeletedItemsBox =
        await HiveUtils.getBox<String>(HiveUtils.unSyncDeletedCeilItemBoxName);
    var syncBox = await HiveUtils.getBox<bool>(HiveUtils.signOutSyncedBox);
    await syncBox.clear();
    await unSyncDeletedItemsBox.clear();
    var unSyncItemsBox = await HiveUtils.getBox<String>(HiveUtils.unSyncCeilItemsBoxName);
    await unSyncItemsBox.clear();
  }
}
