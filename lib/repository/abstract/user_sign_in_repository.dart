import 'package:eisenhower_matrix/models/models.dart';
import 'package:flutter/cupertino.dart';

abstract class UserSignInRepository {
  Future<User> signInAnonymously(BuildContext context);
  Future<User> signInWithGoogle(BuildContext context);
  Future<User> signInWithGithub(BuildContext context);
  Future<User> signInWithTwitter(BuildContext context);
  Future<User> signInWithApple(BuildContext context);
  Future<void> signOut();
}
