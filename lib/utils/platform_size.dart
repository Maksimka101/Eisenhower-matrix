import 'package:eisenhower_matrix/utils/io_platform_adapter.dart';
import 'package:flutter/cupertino.dart';

/// To build flexible UI
class PlatformSize {
  static bool isSmallScreen(BuildContext context) {
    final queryData = MediaQuery.of(context);
    return isAndroid || isIOS || queryData.orientation == Orientation.portrait;
  }

  static bool isMiddleScreen(BuildContext context) {
    final queryData = MediaQuery.of(context);
    return !isSmallScreen(context) && queryData.size.height * 1.6 < queryData.size.width;
  }

  static bool isLargeScreen(BuildContext context) {
    return !isSmallScreen(context) && !isMiddleScreen(context);
  }
}
