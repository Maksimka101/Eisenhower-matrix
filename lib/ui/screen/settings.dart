import 'package:eisenhower_matrix/cubit/sign_in_cubit.dart';
import 'package:eisenhower_matrix/ui/widget/common/platform/platform_app_bar.dart';
import 'package:eisenhower_matrix/ui/widget/common/platform/platform_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PlatformAppBar(
//        backgroundColor: Theme.of(context).appBarTheme.color,
        title: Text(
          'Settings',
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
