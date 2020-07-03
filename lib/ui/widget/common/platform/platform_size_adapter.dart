import 'package:eisenhower_matrix/utils/platform_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformSizeAdapter extends StatelessWidget {
  final Widget child;

  const PlatformSizeAdapter({Key key, @required this.child})
      : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (PlatformSize.isSmallScreen(context)) {
      return child;
    } else {
      // web or desktop large mode
      if (PlatformSize.isMiddleScreen(context)) {
        return Container(
          child: Row(
            children: <Widget>[
              Flexible(
                flex: 2,
                child: Container(),
              ),
              Flexible(
                flex: 3,
                child: child,
              ),
              Expanded(
                flex: 2,
                child: Container(),
              ),
            ],
          ),
        );
      } else {
        return child;
      }
    }
  }
}
