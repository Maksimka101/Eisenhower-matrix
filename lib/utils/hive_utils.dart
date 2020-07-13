import 'package:eisenhower_matrix/models/models.dart';
import 'package:eisenhower_matrix/repository/hive_implementation/ceil_item_adapter.dart';
import 'package:eisenhower_matrix/repository/hive_implementation/duration_adapter.dart';
import 'package:eisenhower_matrix/repository/hive_implementation/settings_adapter.dart';
import 'package:eisenhower_matrix/repository/hive_implementation/user_adapter.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveUtils {
  static bool _initialized = false;
  static const userBoxName = 'user';
  static const ceilItemsBoxName = 'cibn';
  static const unSyncCeilItemsBoxName = 'uscibn';
  static const unSyncDeletedCeilItemBoxName = 'usdcibn';
  static const settingsBoxName = 'settbn';
  static const signOutSyncedBox = 'sosb';

  /// Ensure hive initialized and return [Box] with type [T]
  static Future<Box<T>> getBox<T>(String boxName) async {
    if (!_initialized) {
      await HiveUtils.init();
    }
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box<T>(boxName);
    } else {
      return Hive.openBox<T>(boxName);
    }
  }

  static Future<void> init() async {
    if (!_initialized) {
      _initialized = true;
      Hive.registerAdapter<User>(UserAdapter(0));
      Hive.registerAdapter<SignInProvider>(SignInProviderAdapter(1));
      Hive.registerAdapter<CeilItem>(CeilItemAdapter(2));
      Hive.registerAdapter<CeilType>(CeilTypeAdapter(3));
      Hive.registerAdapter<Settings>(SettingsAdapter(4));
      Hive.registerAdapter<CeilSettings>(CeilSettingsAdapter(5));
      Hive.registerAdapter<Duration>(DurationAdapter(6));
      Hive.registerAdapter<DoneInfo>(DoneInfoAdapter(7));
      if (kIsWeb) {
        Hive.init('');
      } else {
        final appDocDir = await getApplicationDocumentsDirectory();
        Hive.init(appDocDir.path);
      }
    }
  }
}

/// Not null hive type adapter
abstract class NNTypeAdapter<V> extends TypeAdapter<V> {
  final int _typeId;

  NNTypeAdapter(this._typeId);

  @mustCallSuper
  V readNotNull(BinaryReader reader);

  @override
  V read(BinaryReader reader) {
    final isNull = reader.readBool();
    if (isNull == null || isNull) {
      return null;
    }
    return readNotNull(reader);
  }

  @override
  int get typeId => _typeId;

  @mustCallSuper
  void writeNotNull(BinaryWriter writer, V obj);

  @override
  void write(BinaryWriter writer, V obj) {
    writer.writeBool(obj == null);
    writeNotNull(writer, obj);
  }
}
