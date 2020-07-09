import 'dart:async';

import 'package:eisenhower_matrix/models/settings.dart';
import 'package:eisenhower_matrix/repository/abstract/settings_web_repository.dart';

class FirebaseSettingsWebRepository extends SettingsWebRepository {
  final _settingsStream = StreamController<Settings>.broadcast();

  @override
  Stream<Settings> get settingsStream => _settingsStream.stream;

  @override
  Future<Settings> fetchSettings() async {
    // TODO: implement fetchSettings
    return Settings(lastChangeDate: DateTime(2000));
  }

  @override
  Future<Settings> saveSettings(Settings settings) async {
    // TODO: implement saveSettings
    return fetchSettings();
  }

  @override
  Future<void> dispose() async {
    await _settingsStream.close();
  }
}
