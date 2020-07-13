import 'package:eisenhower_matrix/models/models.dart';
import 'package:eisenhower_matrix/utils/hive_utils.dart';
import 'package:hive/hive.dart';

class SettingsAdapter extends NNTypeAdapter<Settings> {
  SettingsAdapter(int typeId) : super(typeId);

  @override
  Settings readNotNull(BinaryReader reader) => Settings(
        ceilSettings: reader.read() as CeilSettings,
        lastChangeDate: reader.read() as DateTime,
      );

  @override
  void writeNotNull(BinaryWriter writer, Settings settings) =>
      writer..write<CeilSettings>(settings.ceilSettings)..write(settings.lastChangeDate);
}

class CeilSettingsAdapter extends NNTypeAdapter<CeilSettings> {
  CeilSettingsAdapter(int typeId) : super(typeId);

  @override
  CeilSettings readNotNull(BinaryReader reader) => CeilSettings(
        doneCeilDeleteDuration: reader.read() as Duration,
      );

  @override
  void writeNotNull(BinaryWriter writer, CeilSettings ceilSettings) =>
      writer..write<Duration>(ceilSettings.doneCeilDeleteDuration);
}
