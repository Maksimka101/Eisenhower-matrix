import 'package:eisenhower_matrix/models/models.dart';
import 'package:eisenhower_matrix/repository/abstract/user_sign_in_repository.dart';
import 'package:flutter/src/widgets/framework.dart';

class MockUserSignInRepository extends UserSignInRepository {
  User user;

  MockUserSignInRepository({@required this.user});

  @override
  Future<User> signInAnonymously(BuildContext context) async {
    return user = User(id: null, name: null, signInProvider: SignInProvider.Anonymous);
  }

  @override
  Future<User> signInWithApple(BuildContext context) async {
    return user = User(id: 'id', name: 'name', signInProvider: SignInProvider.Apple);
  }

  @override
  Future<User> signInWithGithub(BuildContext context) async {
    return user = User(id: 'id', name: 'name', signInProvider: SignInProvider.Github);
  }

  @override
  Future<User> signInWithGoogle(BuildContext context) async {
    return user = User(id: 'id', name: 'name', signInProvider: SignInProvider.Google);
  }

  @override
  Future<User> signInWithTwitter(BuildContext context) async {
    return user = User(id: 'id', name: 'name', signInProvider: SignInProvider.Twitter);
  }

  @override
  Future<void> signOut() async {
    user = null;
  }
}
