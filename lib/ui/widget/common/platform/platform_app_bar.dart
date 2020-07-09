import 'package:eisenhower_matrix/utils/io_platform_adapter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget title;

  const PlatformAppBar({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    if (isMaterial) {
      return AppBar(
        title: title,
      );
    } else {
      return CupertinoNavigationBar(
        middle: DefaultTextStyle(child: title, style: themeData.textTheme.headline6,),
        backgroundColor: themeData.appBarTheme.color,
        brightness: themeData.appBarTheme.brightness,
      );
    }
  }

  /// 44.0 form kMinInteractiveDimensionCupertino
  @override
  Size get preferredSize => Size.fromHeight(isMaterial ? kMinInteractiveDimension : 44.0);
}
