import 'package:cubit/cubit.dart';
import 'package:eisenhower_matrix/models/models.dart';
import 'package:eisenhower_matrix/repository/repository.dart';
import 'package:flutter/cupertino.dart';

import 'sign_in_entity.dart';

class SignInCubit extends Cubit<SignInState> {
  final UserRepository userRepository;

  SignInCubit({@required this.userRepository})
      : assert(userRepository != null),
        super(SignIniInitial()) {
    userRepository.userStream.listen(_userFetched);
  }

  Stream<SignInState> signInStarted(SignInStarted event) async* {
    await userRepository.fetchUser();
  }

  Future<void> _userFetched(User user) async {
    if (user != null) {
      emit(SignedInUser(user: user));
    } else {
      emit(SignedOutUser());
    }
  }

  Future<void> signInWith(
      {@required SignInProvider signInProvider, @required BuildContext context}) async {
    try {
      switch (signInProvider) {
        case SignInProvider.Google:
          await userRepository.signInWithGoogle(context);
          break;
        case SignInProvider.Apple:
          await userRepository.signInWithApple(context);
          break;
        case SignInProvider.Twitter:
          await userRepository.signInWithTwitter(context);
          break;
        case SignInProvider.Github:
          await userRepository.signInWithGithub(context);
          break;
        case SignInProvider.Anonymous:
          await userRepository.signInAnonymously(context);
          break;
      }
    } on CantSignIn catch (cantSignInException) {
      await userRepository.fetchUser();
      switch (cantSignInException.exceptionReason) {
        case SignInExceptionReason.signInRepositoryError:
          emit(SignInError(message: "Can't sign in due to server exception"));
          break;
        case SignInExceptionReason.noInternetConnection:
          emit(SignInError(message: 'Please connect to the internet or sign in anonymously'));
          break;
      }
    } catch (e) {
      debugPrint("Can't sign in due to unknown exception: $e");
      emit(SignInError(message: "Can't sign in due to unknown exception"));
    }
  }

  Future<void> signOut() async {
    await userRepository.signOut();
  }
}
