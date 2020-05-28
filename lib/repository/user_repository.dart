import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:eisenhower_matrix/models/user.dart';
import 'package:eisenhower_matrix/repository/abstract_local_user_repository.dart';
import 'package:eisenhower_matrix/repository/abstract_user_signin_repository.dart';
import 'package:flutter/cupertino.dart';

class UserRepository {
  final _userStream = StreamController<User>.broadcast();
  final UserSignInRepository userSignInRepository;
  final UserLocalRepository userLocalRepository;
  var _internetAvailable = false;

  UserRepository({@required this.userSignInRepository, @required this.userLocalRepository})
      : assert(userSignInRepository != null && userLocalRepository != null) {
    Connectivity()
      ..checkConnectivity().then((connectivityResult) =>
          _internetAvailable = connectivityResult != ConnectivityResult.none)
      ..onConnectivityChanged.listen((connectivityResult) =>
          _internetAvailable = connectivityResult != ConnectivityResult.none);
  }

  Stream<User> get userStream => _userStream.stream;

  /// Load user and push to the [userStream]
  Future<void> fetchUser() async {
    await _syncSignIn();
    final user = await userLocalRepository.fetchUser();
    _userStream.sink.add(user);
  }

  /// Throw [CantSignIn] with [SignInExceptionReason] if something went wrong.
  /// Push signed user to the [userStream].
  Future<void> signInAnonymously() async {
    if (_internetAvailable) {
      try {
        final user = await userSignInRepository.signInAnonymously();
        await userLocalRepository.saveUser(user);
        userLocalRepository.signOutSynchronized = true;
        _userStream.sink.add(user);
      } catch (e) {
        debugPrint('Can not sign in anonymously. Exception: $e');
        throw CantSignIn(
          exceptionReason: SignInExceptionReason.signInRepositoryError,
        );
      }
    } else {
      throw CantSignIn(
        exceptionReason: SignInExceptionReason.noInternetConnection,
      );
    }
  }

  /// Throw [CantSignIn] with [SignInExceptionReason] if something went wrong.
  /// Push signed user to the [userStream].
  Future<void> signInWithGoogle() async {
    if (_internetAvailable) {
      try {
        final user = await userSignInRepository.signInWithGoogle();
        await userLocalRepository.saveUser(user);
        userLocalRepository.signOutSynchronized = true;
        _userStream.sink.add(user);
      } catch (e) {
        debugPrint('Can not sign in with google. Exception: $e');
        throw CantSignIn(
          exceptionReason: SignInExceptionReason.signInRepositoryError,
        );
      }
    } else {
      throw CantSignIn(
        exceptionReason: SignInExceptionReason.noInternetConnection,
      );
    }
  }

  /// Throw [CantSignIn] with [SignInExceptionReason] if something went wrong.
  /// Push signed user to the [userStream].
  Future<void> signInWithTwitter() async {
    if (_internetAvailable) {
      try {
        final user = await userSignInRepository.signInWithTwitter();
        await userLocalRepository.saveUser(user);
        userLocalRepository.signOutSynchronized = true;
        _userStream.sink.add(user);
      } catch (e) {
        debugPrint('Can not sign in with twitter. Exception: $e');
        throw CantSignIn(
          exceptionReason: SignInExceptionReason.signInRepositoryError,
        );
      }
    } else {
      throw CantSignIn(
        exceptionReason: SignInExceptionReason.noInternetConnection,
      );
    }
  }

  /// Throw [CantSignIn] with [SignInExceptionReason] if something went wrong.
  /// Push signed user to the [userStream].
  Future<void> signInWithApple() async {
    if (_internetAvailable) {
      try {
        final user = await userSignInRepository.signInWithApple();
        await userLocalRepository.saveUser(user);
        userLocalRepository.signOutSynchronized = true;
        _userStream.sink.add(user);
      } catch (e) {
        debugPrint('Can not sign in with apple. Exception: $e');
        throw CantSignIn(
          exceptionReason: SignInExceptionReason.signInRepositoryError,
        );
      }
    } else {
      throw CantSignIn(
        exceptionReason: SignInExceptionReason.noInternetConnection,
      );
    }
  }

  Future<void> signOut() async {
    if (_internetAvailable) {
      try {
        await userSignInRepository.signOut();
        await userLocalRepository.signOut();
        userLocalRepository.signOutSynchronized = true;
      } catch (e) {
        debugPrint('Can not sign out. Exception: $e');
        userLocalRepository.signOutSynchronized = false;
        await userLocalRepository.signOut();
      }
    } else {
      userLocalRepository.signOutSynchronized = false;
      await userLocalRepository.signOut();
    }
    _userStream.sink.add(null);
  }

  Future<void> _syncSignIn() async {
    if (!_internetAvailable) {
      return;
    }
    final signOutSynced = await userLocalRepository.isSignOutSynchronized;
    if (!signOutSynced) {
      try {
        await userSignInRepository.signOut();
        userLocalRepository.signOutSynchronized = true;
      } catch (e) {
        debugPrint('Can not sync user sign in. Exception: $e');
      }
    }
  }

  void dispose() {
    _userStream.close();
  }
}

class CantSignIn with Exception {
  final SignInExceptionReason exceptionReason;

  CantSignIn({@required this.exceptionReason}) : assert(exceptionReason != null);
}

enum SignInExceptionReason {
  noInternetConnection,
  signInRepositoryError,
}
