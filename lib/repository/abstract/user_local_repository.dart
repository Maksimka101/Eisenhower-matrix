import 'package:eisenhower_matrix/models/models.dart';

abstract class UserLocalRepository {
  Future<User> fetchUser();

  Future<User> saveUser(User user);

  Future<void> signOut();

  /// For internal usage. Call after sign out.
  Future<void> eraseStorage();

  set signOutSynchronized(bool synchronized);

  Future<bool> get isSignOutSynchronized;
}
