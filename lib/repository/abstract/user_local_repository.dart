import 'package:eisenhower_matrix/models/models.dart';

abstract class UserLocalRepository {
	Future<User> fetchUser();

	Future<User> saveUser(User user);

	Future<void> signOut();

	set signOutSynchronized(bool synchronized);

	Future<bool> get isSignOutSynchronized;
}