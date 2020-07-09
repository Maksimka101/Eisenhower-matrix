import 'package:eisenhower_matrix/utils/io_platform_adapter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformCircularProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (isMaterial) {
      return CircularProgressIndicator();
    } else {
      return CupertinoActivityIndicator();
    }
  }
}
