import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class CustomPlatformIconButton extends StatelessWidget {
  final Widget icon;
  final void Function() onPressed;

  const CustomPlatformIconButton({
    Key key,
    @required this.icon,
    @required this.onPressed,
  })  : assert(icon != null && onPressed != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: icon,
      onTap: onPressed,
    );
  }
}

class PlatformBackButton extends StatelessWidget {
  final Color color;

  const PlatformBackButton({Key key, @required this.color})
      : assert(color != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        PlatformIcons(context).back,
        color: color,
      ),
      onTap: () => Navigator.pop(context),
    );
  }
}
