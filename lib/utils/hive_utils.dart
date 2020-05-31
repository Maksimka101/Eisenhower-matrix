import 'package:eisenhower_matrix/repository/hive_implementation/ceil_item.dart';
import 'package:eisenhower_matrix/repository/hive_implementation/user.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveUtils {
  static bool _initialized = false;
  static const userBoxName = 'user';

  /// Ensure hive initialized and return [Box] with type [T]
  static Future<Box<T>> getBox<T>(String boxName) async {
    if (_initialized) {
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
      Hive.registerAdapter<HiveUser>(HiveUserAdapter());
      Hive.registerAdapter<HiveSignInProvider>(HiveSignInProviderAdapter());
      Hive.registerAdapter<HiveCeilItem>(HiveCeilItemAdapter());
      Hive.init((await getApplicationDocumentsDirectory()).path);
      _initialized = true;
    }
  }
}
