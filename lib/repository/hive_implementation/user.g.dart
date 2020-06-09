// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveSignInProviderAdapter extends TypeAdapter<HiveSignInProvider> {
  @override
  final typeId = 1;

  @override
  HiveSignInProvider read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return HiveSignInProvider.Google;
      case 1:
        return HiveSignInProvider.Github;
      case 2:
        return HiveSignInProvider.Apple;
      case 3:
        return HiveSignInProvider.Twitter;
      case 4:
        return HiveSignInProvider.Anonymous;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, HiveSignInProvider obj) {
    switch (obj) {
      case HiveSignInProvider.Google:
        writer.writeByte(0);
        break;
      case HiveSignInProvider.Github:
        writer.writeByte(1);
        break;
      case HiveSignInProvider.Apple:
        writer.writeByte(2);
        break;
      case HiveSignInProvider.Twitter:
        writer.writeByte(3);
        break;
      case HiveSignInProvider.Anonymous:
        writer.writeByte(4);
        break;
    }
  }
}

class HiveUserAdapter extends TypeAdapter<HiveUser> {
  @override
  final typeId = 0;

  @override
  HiveUser read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveUser(
      id: fields[0] as String,
      name: fields[1] as String,
      photoUrl: fields[2] as String,
      signInProvider: fields[3] as HiveSignInProvider,
      signOutSynced: fields[4] as bool,
      userExist: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, HiveUser obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.photoUrl)
      ..writeByte(3)
      ..write(obj.signInProvider)
      ..writeByte(4)
      ..write(obj.signOutSynced)
      ..writeByte(5)
      ..write(obj.userExist);
  }
}
