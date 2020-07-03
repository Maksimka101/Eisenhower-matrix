import 'package:eisenhower_matrix/utils/io_platform_adapter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformIconButton extends StatelessWidget {
  final Icon icon;
  final Function() onTap;

  const PlatformIconButton({Key key, @required this.onTap, @required this.icon}) : super(key: key);

  Widget _buildMaterial() => InkWell(
        child: icon,
        onTap: onTap,
      );

  Widget _buildCupertino() => GestureDetector(
        child: icon,
        onTap: onTap,
      );

  @override
  Widget build(BuildContext context) {
    if (isMaterial) {
      return _buildMaterial();
    } else {
      return _buildCupertino();
    }
  }
}
