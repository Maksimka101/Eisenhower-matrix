// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveSettingsAdapter extends TypeAdapter<HiveSettings> {
  @override
  final typeId = 4;

  @override
  HiveSettings read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveSettings(
      hiveCeilSettings: fields[0] as HiveCeilSettings,
      lastChangeDate: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, HiveSettings obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.hiveCeilSettings)
      ..writeByte(1)
      ..write(obj.lastChangeDate);
  }
}

class HiveCeilSettingsAdapter extends TypeAdapter<HiveCeilSettings> {
  @override
  final typeId = 5;

  @override
  HiveCeilSettings read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveCeilSettings(
      doneCeilDeleteDuration: fields[0] as Duration,
    );
  }

  @override
  void write(BinaryWriter writer, HiveCeilSettings obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.doneCeilDeleteDuration);
  }
}
