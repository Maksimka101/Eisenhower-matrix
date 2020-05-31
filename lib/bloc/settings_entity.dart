import 'package:equatable/equatable.dart';

abstract class SettingsEvent extends Equatable {
	@override
  List<Object> get props => [];
}

abstract class SettingsState extends Equatable {
	@override
  List<Object> get props => [];
}

class SettingsInitial extends SettingsState {}