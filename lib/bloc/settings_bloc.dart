import 'package:eisenhower_matrix/bloc/settings_entity.dart';
import 'package:eisenhower_matrix/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepository settingsRepository;

  SettingsBloc({@required this.settingsRepository}) : assert(settingsRepository != null);

  @override
  SettingsState get initialState => SettingsInitial();

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) {
    throw UnimplementedError();
  }
}
