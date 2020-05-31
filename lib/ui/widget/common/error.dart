import 'package:flutter/cupertino.dart';

class WidgetError extends StatelessWidget {
	final String message;

  const WidgetError({Key key, this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(message??'Some shit were happen');
  }
}
