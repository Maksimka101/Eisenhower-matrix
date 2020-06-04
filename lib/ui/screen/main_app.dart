import 'package:eisenhower_matrix/ui/screen/matrix.dart';
import 'package:eisenhower_matrix/ui/screen/settings.dart';
import 'package:eisenhower_matrix/ui/widget/common/error.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class MainAppScreen extends StatelessWidget {
  final _controller = PlatformTabController();

  Widget _errorScreen(String message) => PlatformScaffold(
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
    return PlatformTabScaffold(
      tabController: _controller,
      bodyBuilder: (context, index) {
        switch (index) {
          case 0:
            return MatrixScreen();
          case 1:
            return SettingsScreen();
          default:
            return _errorScreen('Unknown page index: $index');
        }
      },
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
    );
  }
}
