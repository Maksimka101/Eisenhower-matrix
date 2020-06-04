import 'package:eisenhower_matrix/bloc/bloc.dart';
import 'package:eisenhower_matrix/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SignInWithGoogleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _LoadingButton(
      text: Text('Sign in with Google'),
      onPressed: () => BlocProvider.of<SignInBloc>(context).add(
        SignInWith(
          context: context,
          signInProvider: SignInProvider.Google,
        ),
      ),
    );
  }
}

class SignInWithGitHubButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _LoadingButton(
      text: Text('Sign in with GitHub'),
      onPressed: () => BlocProvider.of<SignInBloc>(context).add(
        SignInWith(
          context: context,
          signInProvider: SignInProvider.Github,
        ),
      ),
    );
  }
}

class SignInWithAppleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _LoadingButton(
      text: Text('Sign in with Apple'),
//      onPressed: () => BlocProvider.of<SignInBloc>(context).add(
//        SignInWith(
//          context: context,
//          signInProvider: SignInProvider.Apple,
//        ),
//      ),
    );
  }
}

class SignInWithTwitterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _LoadingButton(
      text: Text('Sign in with Twitter'),
//      onPressed: () => BlocProvider.of<SignInBloc>(context).add(
//        SignInWith(
//          context: context,
//          signInProvider: SignInProvider.Twitter,
//        ),
//      ),
    );
  }
}

class SignInAnonymouslyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _LoadingButton(
      text: Text('Sign in Anonymously'),
      onPressed: () => BlocProvider.of<SignInBloc>(context).add(
        SignInWith(
          context: context,
          signInProvider: SignInProvider.Anonymous,
        ),
      ),
    );
  }
}

class _LoadingButton extends StatefulWidget {
  final Widget text;
  final void Function() onPressed;

  const _LoadingButton({
    Key key,
    @required this.text,
    this.onPressed,
  })  : assert(text != null),
        super(key: key);

  @override
  __LoadingButtonState createState() => __LoadingButtonState();
}

class __LoadingButtonState extends State<_LoadingButton> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: PlatformButton(
        child: widget.text,
        onPressed: () {
          setState(() {
            _isLoading = !_isLoading;
          });
          widget.onPressed();
        },
      ),
      secondChild: PlatformCircularProgressIndicator(),
      crossFadeState: _isLoading ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: Duration(milliseconds: 400),
    );
  }
}
