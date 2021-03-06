import 'package:eisenhower_matrix/models/user.dart';
import 'package:eisenhower_matrix/repository/abstract/user_sign_in_repository.dart';
import 'package:eisenhower_matrix/repository/credential_models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseUserSignInRepository extends UserSignInRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GitHubCredentials gitHubCredentials;
  final AppleCredentials appleCredentials;
  final TwitterCredentials twitterCredentials;

  FirebaseUserSignInRepository({
    @required this.gitHubCredentials,
    @required this.appleCredentials,
    @required this.twitterCredentials,
  }) : assert(gitHubCredentials != null && appleCredentials != null && twitterCredentials != null);

  @override
  Future<User> signInAnonymously(BuildContext context) async {
    await _firebaseAuth.signInAnonymously();

    return User(
        id: '',
        name: 'Anonymous',
        signInProvider: SignInProvider.Anonymous,
        photoUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Anonymous_emblem.svg/200px-Anonymous_emblem.svg.png');
  }

  @override
  Future<User> signInWithApple(BuildContext context) {
    // TODO: implement signInWithApple
    throw UnimplementedError();
  }

  @override
  Future<User> signInWithGithub(BuildContext context) async {
    final githubUser = await GitHubSignIn(
      clientId: gitHubCredentials.clientId,
      clientSecret: gitHubCredentials.clientSecret,
      redirectUrl: gitHubCredentials.redirectUrl,
    ).signIn(context);
    final githubToken = await githubUser.token;

    final credential = GithubAuthProvider.getCredential(token: githubToken);

    final authResult = await _firebaseAuth.signInWithCredential(credential);
    final firebaseUser = await authResult.user;

    return User(
      id: firebaseUser.uid,
      name: firebaseUser.displayName,
      signInProvider: SignInProvider.Google,
      photoUrl: firebaseUser.photoUrl,
    );
  }

  @override
  Future<User> signInWithGoogle(_) async {
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    final authResult = await _firebaseAuth.signInWithCredential(credential);
    final firebaseUser = await authResult.user;

    return User(
      id: firebaseUser.uid,
      name: firebaseUser.displayName,
      signInProvider: SignInProvider.Google,
      photoUrl: firebaseUser.photoUrl,
    );
  }

  @override
  Future<User> signInWithTwitter(BuildContext context) {
    // TODO: implement signInWithTwitter
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
