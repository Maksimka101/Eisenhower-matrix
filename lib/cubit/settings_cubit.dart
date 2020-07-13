import 'package:eisenhower_matrix/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_cubit.freezed.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepository settingsRepository;

  SettingsCubit({@required this.settingsRepository})
      : assert(settingsRepository != null),
        super(SettingsState.initial());
}

@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = Initial;
}