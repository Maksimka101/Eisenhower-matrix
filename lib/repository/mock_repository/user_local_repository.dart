import 'package:eisenhower_matrix/models/models.dart';
import 'package:eisenhower_matrix/repository/abstract/user_local_repository.dart';
import 'package:flutter/cupertino.dart';

class MockUserLocalRepository extends UserLocalRepository {
  User user;
  bool signSynced;

  MockUserLocalRepository({@required this.user, @required this.signSynced});

  @override
  Future<void> eraseStorage() async {}

  @override
  Future<User> fetchUser() async {
    return user;
  }

  @override
  Future<bool> get isSignOutSynchronized async => signSynced;

  @override
  Future<User> saveUser(User usr) async {
    return user = usr;
  }

  @override
  Future<void> signOut() async {
    user = null;
  }

  @override
  Future<void> signOutSynchronized(bool synced) async {
    signSynced = synced;
  }
}
