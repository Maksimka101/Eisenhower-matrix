import 'package:eisenhower_matrix/models/settings.dart';

abstract class SettingsLocalRepository {
	Future<Settings> fetchSettings();

	Future<Settings> saveSettings(Settings settings);

	Future<void> dispose();
}