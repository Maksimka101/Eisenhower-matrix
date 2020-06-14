import 'package:eisenhower_matrix/utils/io_platform_adapter.dart';
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
    if (isAndroid || isIOS) {
      return child;
    } else {
      final queryData = MediaQuery.of(context);
      // web or desktop large mode
      if (queryData.orientation == Orientation.landscape &&
          queryData.size.height * 1.45 < queryData.size.width) {
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
