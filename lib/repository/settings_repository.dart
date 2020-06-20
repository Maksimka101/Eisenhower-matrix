import 'package:eisenhower_matrix/repository/abstract/settings_local_repository.dart';
import 'package:eisenhower_matrix/repository/abstract/settings_web_repository.dart';
import 'package:eisenhower_matrix/utils/connection.dart';
import 'package:flutter/cupertino.dart';

class SettingsRepository {
  final SettingsLocalRepository settingsLocalRepository;
  final SettingsWebRepository settingsWebRepository;
  final Connection connection;

  SettingsRepository({
    @required this.settingsLocalRepository,
    @required this.settingsWebRepository,
    @required this.connection,
  }) : assert(
            settingsLocalRepository != null && settingsWebRepository != null && connection != null);
}
