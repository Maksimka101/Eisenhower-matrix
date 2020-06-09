import 'package:eisenhower_matrix/models/models.dart';
import 'package:eisenhower_matrix/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sign_in_entity.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserRepository userRepository;

  SignInBloc({@required this.userRepository}) : assert(userRepository != null) {
    userRepository.userStream.listen(_userStateListener);
  }

  void _userStateListener(User user) => add(SignInUserFetched(user: user));

  @override
  SignInState get initialState => SignIniInitial();

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    switch (event.runtimeType) {
      case SignInStarted:
        yield* _mapSignInStartedToState(event);
        break;
      case SignInUserFetched:
        yield* _mapUserFetchedToState(event);
        break;
      case SignInWith:
        yield* _mapSignInWithToState(event);
        break;
      case SignOut:
        yield* _mapSignOutToState(event);
        break;
      default:
        debugPrint('Unknown SignInEvent: $event');
        break;
    }
  }

  Stream<SignInState> _mapSignInStartedToState(SignInStarted event) async* {
    await userRepository.fetchUser();
  }

  Stream<SignInState> _mapUserFetchedToState(SignInUserFetched event) async* {
    if (event.user != null) {
      yield SignedInUser(user: event.user);
    } else {
      yield SignedOutUser();
    }
  }

  Stream<SignInState> _mapSignInWithToState(SignInWith event) async* {
    try {
      switch (event.signInProvider) {
        case SignInProvider.Google:
          await userRepository.signInWithGoogle(event.context);
          break;
        case SignInProvider.Apple:
          await userRepository.signInWithApple(event.context);
          break;
        case SignInProvider.Twitter:
          await userRepository.signInWithTwitter(event.context);
          break;
        case SignInProvider.Github:
          await userRepository.signInWithGithub(event.context);
          break;
        case SignInProvider.Anonymous:
          await userRepository.signInAnonymously(event.context);
          break;
      }
    } on CantSignIn catch (cantSignInException) {
      await userRepository.fetchUser();
      switch (cantSignInException.exceptionReason) {
        case SignInExceptionReason.signInRepositoryError:
          yield SignInError(message: "Can't sign in due to server exception");
          break;
        case SignInExceptionReason.noInternetConnection:
          yield SignInError(message: 'Please connect to the internet or sign in anonymously');
          break;
      }
    } catch (e) {
      debugPrint("Can't sign in due to unknown exception: $e");
      yield SignInError(message: "Can't sign in due to unknown exception");
    }
  }

  Stream<SignInState> _mapSignOutToState(SignOut event) async* {
    await userRepository.signOut();
  }
}
