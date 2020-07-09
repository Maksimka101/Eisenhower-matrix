import 'package:eisenhower_matrix/models/settings.dart';
import 'package:eisenhower_matrix/repository/abstract/settings_local_repository.dart';

class MockSettingsLocalRepository extends SettingsLocalRepository {
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

}