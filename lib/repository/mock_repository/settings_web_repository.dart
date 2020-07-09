import 'package:eisenhower_matrix/models/settings.dart';
import 'package:eisenhower_matrix/repository/abstract/settings_web_repository.dart';

class MockSettingsWebRepository extends SettingsWebRepository {
  @override
  Future<void> dispose() {
    // TODO: implement dispose
    throw UnimplementedError();
  }

  @override
  Future<Settings> fetchSettings() {
    // TODO: implement fetchSettings
    throw UnimplementedError();
  }

  @override
  Future<Settings> saveSettings(Settings settings) {
    // TODO: implement saveSettings
    throw UnimplementedError();
  }

  @override
  // TODO: implement settingsStream
  Stream<Settings> get settingsStream => throw UnimplementedError();
}
