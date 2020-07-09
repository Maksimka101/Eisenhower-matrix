import 'package:eisenhower_matrix/ui/screen/matrix.dart';
import 'package:eisenhower_matrix/ui/screen/settings.dart';
import 'package:eisenhower_matrix/ui/widget/common/error.dart';
import 'package:eisenhower_matrix/ui/widget/common/platform/platform_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainAppScreen extends StatefulWidget {
  @override
  _MainAppScreenState createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  var fullScreenMode = true;

  void _changeScreenMode(bool fullScreen) => setState(() => fullScreenMode = fullScreen);

  Widget _errorScreen(String message) => Scaffold(
        appBar: PlatformAppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: WidgetError(
            message: message,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    if (!fullScreenMode) {
      return CupertinoTabScaffold(
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return MatrixScreen(
                fullScreenMode: fullScreenMode,
                onChangeScreenMode: _changeScreenMode,
              );
            case 1:
              return SettingsScreen();
            default:
              return _errorScreen('Unknown page index: $index');
          }
        },
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.border_all),
              title: Text('Matrix'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_pin),
              title: Text('Account'),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        body: MatrixScreen(
          fullScreenMode: fullScreenMode,
          onChangeScreenMode: _changeScreenMode,
        ),
      );
    }
  }
}
