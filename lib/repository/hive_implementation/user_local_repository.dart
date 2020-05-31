import 'package:eisenhower_matrix/models/user.dart';
import 'package:eisenhower_matrix/repository/abstract/user_local_repository.dart';
import 'package:eisenhower_matrix/utils/hive_utils.dart';

import 'user.dart';

class HiveUserLocalRepository extends UserLocalRepository {
  @override
  Future<User> fetchUser() async {
    var userBox = await HiveUtils.getBox<HiveUser>(HiveUtils.userBoxName);
    return userBox.get(HiveUtils.userBoxName).toUser();
  }

  @override
  Future<bool> get isSignOutSynchronized async {
    var userBox = await HiveUtils.getBox<HiveUser>(HiveUtils.userBoxName);
    return userBox.get(HiveUtils.userBoxName).signOutSynced ?? false;
  }

  @override
  Future<User> saveUser(User user) async {
    var userBox = await HiveUtils.getBox<HiveUser>(HiveUtils.userBoxName);
    var synced = await isSignOutSynchronized;
    await userBox.put(HiveUtils.userBoxName, HiveUser.fromUser(user, synced));
    return user;
  }

  @override
  Future<void> signOut() async {
    var userBox = await HiveUtils.getBox<HiveUser>(HiveUtils.userBoxName);
    await userBox.put(HiveUtils.userBoxName, null);
  }

  @override
  set signOutSynchronized(bool synchronized) {
    HiveUtils.getBox<HiveUser>(HiveUtils.userBoxName).then((userBox) {
      var hiveUser = userBox.get(HiveUtils.userBoxName);
      userBox.put(
        HiveUtils.userBoxName,
        HiveUser(
          signOutSynced: synchronized,
          name: hiveUser.name,
          signInProvider: hiveUser.signInProvider,
          id: hiveUser.id,
          photoUrl: hiveUser.photoUrl,
        ),
      );
    });
  }
}
