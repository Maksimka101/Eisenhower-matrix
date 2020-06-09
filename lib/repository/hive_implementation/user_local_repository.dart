import 'package:eisenhower_matrix/models/user.dart';
import 'package:eisenhower_matrix/repository/abstract/user_local_repository.dart';
import 'package:eisenhower_matrix/repository/hive_implementation/ceil_item.dart';
import 'package:eisenhower_matrix/utils/hive_utils.dart';

import 'user.dart';

class HiveUserLocalRepository extends UserLocalRepository {
  HiveUserLocalRepository() {
    HiveUtils.init();
  }

  @override
  Future<User> fetchUser() async {
    var userBox = await HiveUtils.getBox<HiveUser>(HiveUtils.userBoxName);
    final hiveUser = userBox.get(HiveUtils.userBoxName);
    if (hiveUser == null || hiveUser.userExist == null || !hiveUser.userExist) {
      return null;
    } else {
      return hiveUser?.toUser();
    }
  }

  @override
  Future<bool> get isSignOutSynchronized async {
    var userBox = await HiveUtils.getBox<HiveUser>(HiveUtils.userBoxName);
    return userBox.get(HiveUtils.userBoxName)?.signOutSynced ?? false;
  }

  @override
  Future<User> saveUser(User user) async {
    var userBox = await HiveUtils.getBox<HiveUser>(HiveUtils.userBoxName);
    var synced = await isSignOutSynchronized;
    await userBox.put(HiveUtils.userBoxName, HiveUser.fromUser(user, synced));
    await userBox.compact();
    return user;
  }

  @override
  Future<void> signOut() async {
    var userBox = await HiveUtils.getBox<HiveUser>(HiveUtils.userBoxName);
    await userBox.put(
      HiveUtils.userBoxName,
      HiveUser(
        userExist: false,
        id: null,
        signInProvider: null,
        name: null,
        signOutSynced: null,
        photoUrl: null,
      ),
    );
    await eraseStorage();
  }

  @override
  Future<void> signOutSynchronized(bool synchronized) async {
    var userBox = await HiveUtils.getBox<HiveUser>(HiveUtils.userBoxName);
    var hiveUser = userBox.get(HiveUtils.userBoxName);
    await userBox.put(
      HiveUtils.userBoxName,
      HiveUser(
        signOutSynced: synchronized,
        name: hiveUser?.name,
        signInProvider: hiveUser?.signInProvider,
        id: hiveUser?.id,
        photoUrl: hiveUser?.photoUrl,
        userExist: hiveUser.userExist,
      ),
    );
  }

  /// For internal usage
  @override
  Future<void> eraseStorage() async {
    var itemsBox = await HiveUtils.getBox<HiveCeilItem>(HiveUtils.ceilItemsBoxName);
    await itemsBox.clear();
    var unSyncDeletedItemsBox =
        await HiveUtils.getBox<String>(HiveUtils.unSyncDeletedCeilItemBoxName);
    await unSyncDeletedItemsBox.clear();
    var unSyncItemsBox = await HiveUtils.getBox<String>(HiveUtils.unSyncCeilItemsBoxName);
    await unSyncItemsBox.clear();
  }
}
