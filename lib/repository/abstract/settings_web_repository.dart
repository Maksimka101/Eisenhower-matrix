import 'package:eisenhower_matrix/models/settings.dart';

abstract class SettingsWebRepository {
  Stream<Settings> get settingsStream;

  Future<Settings> fetchSettings();

  Future<Settings> saveSettings(Settings settings);

  Future<void> dispose();
}
