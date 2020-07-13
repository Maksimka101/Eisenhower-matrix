import 'package:eisenhower_matrix/utils/hive_utils.dart';
import 'package:hive/hive.dart';

class DurationAdapter extends NNTypeAdapter<Duration> {
  DurationAdapter(int typeId) : super(typeId);

  @override
  Duration readNotNull(BinaryReader reader) {
    return Duration(milliseconds: reader.readInt());
  }

  @override
  void writeNotNull(BinaryWriter writer, Duration obj) {
    writer.writeInt(obj.inMilliseconds);
  }
}
