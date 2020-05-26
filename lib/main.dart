import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

void main() => runApp(AppInit());

class AppInit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformProvider(
      builder: (_) => PlatformApp(
        home: UserInit(),
      ),
    );
  }
}

class UserInit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('No'),
      ),
      body: Center(
        child: PlatformCircularProgressIndicator(),
      ),
    );
  }
}
