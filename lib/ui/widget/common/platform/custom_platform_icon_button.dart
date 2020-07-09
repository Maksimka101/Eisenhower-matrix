import 'package:flutter/cupertino.dart';

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

  const PlatformBackButton({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        CupertinoIcons.back,
        color: color,
      ),
      onTap: () => Navigator.pop(context),
    );
  }
}
