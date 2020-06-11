import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class PlatformTheme {
  factory PlatformTheme.of(BuildContext context) {
    final currentPlatform = PlatformProvider.of(context).platform;
    assert([TargetPlatform.iOS, TargetPlatform.android].contains(currentPlatform),
        'Current platform must be android or ios');
    if (currentPlatform == TargetPlatform.iOS) {
      var cupertinoThemeData = CupertinoTheme.of(context);
      return PlatformTheme._(
        scaffoldBackgroundColor: cupertinoThemeData.scaffoldBackgroundColor,
      );
    } else {
      var themeData = Theme.of(context);
      return PlatformTheme._(scaffoldBackgroundColor: themeData.scaffoldBackgroundColor);
    }
  }

  PlatformTheme._({@required this.scaffoldBackgroundColor})
      : assert(scaffoldBackgroundColor != null);

  final Color scaffoldBackgroundColor;
}
