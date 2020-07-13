import 'package:eisenhower_matrix/models/models.dart';
import 'package:eisenhower_matrix/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_cubit.freezed.dart';

class SignInCubit extends Cubit<SignInState> {
  final UserRepository userRepository;

  SignInCubit({@required this.userRepository})
      : assert(userRepository != null),
        super(SignInState.initial()) {
    userRepository.userStream.listen(_userFetched);
  }

  Future<void> signInStarted() async {
    await userRepository.fetchUser();
  }

  Future<void> _userFetched(User user) async {
    if (user != null) {
      emit(SignInState.signedIn(user: user));
    } else {
      emit(SignInState.signedOut());
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
          emit(SignInState.error(message: "Can't sign in due to server exception"));
          break;
        case SignInExceptionReason.noInternetConnection:
          emit(SignInState.error(message: 'Please connect to the internet or sign in anonymously'));
          break;
      }
    } catch (e) {
      debugPrint("Can't sign in due to unknown exception: $e");
      emit(SignInState.error(message: "Can't sign in due to unknown exception"));
    }
  }

  Future<void> signOut() async {
    await userRepository.signOut();
  }
}

@freezed
abstract class SignInState with _$SignInState {
  const factory SignInState.initial() = Initial;

  const factory SignInState.signedIn({@required User user}) = SignedIn;

  const factory SignInState.signedOut() = SignedOut;

  const factory SignInState.error({@required String message}) = Error;
}
