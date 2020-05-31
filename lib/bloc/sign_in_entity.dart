import 'package:eisenhower_matrix/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class SignInEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignInStarted extends SignInEvent {}

class SignInUserFetched extends SignInEvent {
  final User user;

  SignInUserFetched({@required this.user});

  @override
  List<Object> get props => [user];
}

class SignInWith extends SignInEvent {
  final BuildContext context;
  final SignInProvider signInProvider;

  SignInWith({@required this.signInProvider, @required this.context})
      : assert(signInProvider != null && context != null);

  @override
  List<Object> get props => [signInProvider, context];
}

class SignOut extends SignInEvent {
  final BuildContext context;

  SignOut({@required this.context}) : assert(context != null);

  @override
  List<Object> get props => [context];
}

abstract class SignInState extends Equatable {
  @override
  List<Object> get props => [];
}

class SignIniInitial extends SignInState {}

class SignedOutUser extends SignInState {}

class SignedInUser extends SignInState {
  final User user;

  SignedInUser({@required this.user}) : assert(user != null);

  @override
  List<Object> get props => [user];
}

class SignInError extends SignInState {
  final String message;

  SignInError({@required this.message}) : assert(message != null);

  @override
  List<Object> get props => [message];
}
