import 'package:cubit/cubit.dart';
import 'package:eisenhower_matrix/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepository settingsRepository;

  SettingsCubit({@required this.settingsRepository})
      : assert(settingsRepository != null),
        super(SettingsInitial());
}

abstract class SettingsState extends Equatable {
  @override
  List<Object> get props => [];
}

class SettingsInitial extends SettingsState {}
