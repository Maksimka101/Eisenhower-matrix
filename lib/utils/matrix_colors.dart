import 'package:flutter/material.dart';

Color getCeilColor(BuildContext context) {
  return Theme.of(context).scaffoldBackgroundColor;
}

Color getCeilTitleColor(BuildContext context) {
  return Theme.of(context).dividerColor;
}

//Color getCeilColor(BuildContext context) {
//  return MediaQuery.of(context).platformBrightness == Brightness.dark
//      ? Colors.grey[850]
//      : Colors.grey[50];
//}
//
//Color getCeilTitleColor(BuildContext context) {
//  return MediaQuery.of(context).platformBrightness == Brightness.dark
//      ? const Color(0x1FFFFFFF)
//      : const Color(0x1F000000);
//}

