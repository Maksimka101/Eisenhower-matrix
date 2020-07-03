import 'package:eisenhower_matrix/bloc/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        backgroundColor: Theme.of(context).appBarTheme.color,
        title: Text(
          'Settings',
          style: DefaultTextStyle.of(context).style,
        ),
      ),
      body: Center(
        child: PlatformButton(
          child: Text('Sign Out'),
          onPressed: context.cubit<SignInCubit>().signOut,
        ),
      ),
    );
  }
}
