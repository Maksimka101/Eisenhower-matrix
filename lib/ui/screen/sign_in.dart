import 'package:eisenhower_matrix/ui/widget/sign_in_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PlatformScaffold(
        appBar: PlatformAppBar(
          title: Text('Sign in'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SignInWithGitHubButton(),
                SizedBox(height: 10),
                SignInWithAppleButton(),
                SizedBox(height: 10),
                SignInWithGoogleButton(),
                SizedBox(height: 10),
                SignInWithTwitterButton(),
                SizedBox(height: 10),
                SignInAnonymouslyButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
