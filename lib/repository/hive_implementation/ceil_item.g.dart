// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ceil_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveCeilTypeAdapter extends TypeAdapter<HiveCeilType> {
  @override
  final typeId = 3;

  @override
  HiveCeilType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return HiveCeilType.UrgentImportant;
      case 1:
        return HiveCeilType.UrgentNotImportant;
      case 2:
        return HiveCeilType.NotUrgentImportant;
      case 3:
        return HiveCeilType.NotUrgentNotImportant;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, HiveCeilType obj) {
    switch (obj) {
      case HiveCeilType.UrgentImportant:
        writer.writeByte(0);
        break;
      case HiveCeilType.UrgentNotImportant:
        writer.writeByte(1);
        break;
      case HiveCeilType.NotUrgentImportant:
        writer.writeByte(2);
        break;
      case HiveCeilType.NotUrgentNotImportant:
        writer.writeByte(3);
        break;
    }
  }
}

class HiveCeilItemAdapter extends TypeAdapter<HiveCeilItem> {
  @override
  final typeId = 2;

  @override
  HiveCeilItem read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveCeilItem(
      title: fields[0] as String,
      id: fields[1] as String,
      ceilType: fields[2] as HiveCeilType,
      index: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HiveCeilItem obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.ceilType)
      ..writeByte(3)
      ..write(obj.index);
  }
}
