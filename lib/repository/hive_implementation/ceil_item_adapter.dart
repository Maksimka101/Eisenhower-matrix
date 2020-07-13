import 'package:eisenhower_matrix/models/models.dart';
import 'package:eisenhower_matrix/utils/hive_utils.dart';
import 'package:hive/hive.dart';

class CeilItemAdapter extends NNTypeAdapter<CeilItem> {
  CeilItemAdapter(int typeId) : super(typeId);

  @override
  CeilItem readNotNull(BinaryReader reader) => CeilItem(
        title: reader.readString(),
        id: reader.readString(),
        index: reader.readInt(),
        ceilType: reader.read() as CeilType,
        doneInfo: reader.read() as DoneInfo,
      );

  @override
  void writeNotNull(BinaryWriter writer, CeilItem ceilItem) => writer
    ..writeString(ceilItem.title)
    ..writeString(ceilItem.id)
    ..writeInt(ceilItem.index)
    ..write<CeilType>(ceilItem.ceilType)
    ..write<DoneInfo>(ceilItem.doneInfo);
}

class CeilTypeAdapter extends NNTypeAdapter<CeilType> {
  CeilTypeAdapter(int typeId) : super(typeId);

  @override
  CeilType readNotNull(BinaryReader reader) => CeilType.values[reader.readInt()];

  @override
  void writeNotNull(BinaryWriter writer, CeilType ceilType) => writer.writeInt(ceilType.index);
}

class DoneInfoAdapter extends NNTypeAdapter<DoneInfo> {
  DoneInfoAdapter(int typeId) : super(typeId);

  @override
  DoneInfo readNotNull(BinaryReader reader) => DoneInfo(
        done: reader.readBool(),
        doneAt: reader.read() as DateTime,
      );

  @override
  void writeNotNull(BinaryWriter writer, DoneInfo doneInfo) => writer
    ..writeBool(doneInfo.done)
    ..write<DateTime>(doneInfo.doneAt);
}
