import 'package:eisenhower_matrix/utils/io_platform_adapter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformButton extends StatelessWidget {
  final Widget child;
  final void Function() onPressed;

  const PlatformButton({Key key, @required this.onPressed, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isMaterial) {
      return MaterialButton(
        onPressed: onPressed,
        child: child,
      );
    } else {
      return CupertinoButton(
        child: child,
        onPressed: onPressed,
      );
    }
  }
}
