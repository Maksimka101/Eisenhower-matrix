import 'package:eisenhower_matrix/models/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'settings.g.dart';

@HiveType(typeId: 4)
class HiveSettings {
  @HiveField(0)
  final HiveCeilSettings hiveCeilSettings;
  @HiveField(1)
  final DateTime lastChangeDate;

  HiveSettings({
    @required this.hiveCeilSettings,
    @required this.lastChangeDate,
  });

  factory HiveSettings.fromSettings(Settings settings) => HiveSettings(
        hiveCeilSettings: HiveCeilSettings.fromCeilSettings(settings.ceilSettings),
        lastChangeDate: settings.lastChangeDate,
      );

  Settings toSettings() => Settings(
        ceilSettings: hiveCeilSettings.toCeilSettings(),
        lastChangeDate: lastChangeDate,
      );
}

@HiveType(typeId: 5)
class HiveCeilSettings {
  @HiveField(0)
  final Duration doneCeilDeleteDuration;

  HiveCeilSettings({@required this.doneCeilDeleteDuration});

  factory HiveCeilSettings.fromCeilSettings(CeilSettings ceilSettings) => HiveCeilSettings(
        doneCeilDeleteDuration: ceilSettings.doneCeilDeleteDuration,
      );

  CeilSettings toCeilSettings() => CeilSettings(
        doneCeilDeleteDuration: doneCeilDeleteDuration,
      );
}
