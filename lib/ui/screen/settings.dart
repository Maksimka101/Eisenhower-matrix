import 'package:eisenhower_matrix/bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: PlatformButton(
          child: Text('Sign Out'),
          onPressed: () {
            BlocProvider.of<SignInBloc>(context).add(SignOut());
          },
        ),
      ),
    );
  }
}
