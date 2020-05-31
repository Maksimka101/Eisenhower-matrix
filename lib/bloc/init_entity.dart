import 'package:eisenhower_matrix/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class InitEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class InitStarted extends InitEvent {}

class InitFetchedUser extends InitEvent {
  final User user;

  InitFetchedUser({@required this.user});

  @override
  List<Object> get props => [user];
}

abstract class InitState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitInitial extends InitState {}

class InitSignedIn extends InitState {}

class InitSignedOut extends InitState {}
