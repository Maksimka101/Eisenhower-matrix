import 'package:eisenhower_matrix/models/user.dart';

abstract class UserSignInRepository {
  Future<User> signInAnonymously();
  Future<User> signInWithGoogle();
  Future<User> signInWithTwitter();
  Future<User> signInWithApple();
  Future<void> signOut();
}
