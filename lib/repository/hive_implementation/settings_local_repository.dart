import 'package:eisenhower_matrix/models/settings.dart';
import 'package:eisenhower_matrix/repository/abstract/settings_local_repository.dart';
import 'package:eisenhower_matrix/utils/hive_utils.dart';

class HiveSettingsLocalRepository extends SettingsLocalRepository {
  @override
  Future<Settings> fetchSettings() async {
    var box = await HiveUtils.getBox<Settings>(HiveUtils.settingsBoxName);
    var settings = box.get(HiveUtils.settingsBoxName);
    return settings;
  }

  @override
  Future<Settings> saveSettings(Settings settings) async {
    var box = await HiveUtils.getBox<Settings>(HiveUtils.settingsBoxName);
    await box.put(HiveUtils.settingsBoxName, settings);
    return fetchSettings();
  }

  @override
  Future<void> dispose() async {}
}
