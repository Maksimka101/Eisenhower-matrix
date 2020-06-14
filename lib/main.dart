import 'package:eisenhower_matrix/bloc/bloc_base.dart';
import 'package:eisenhower_matrix/utils/io_platform_adapter.dart';
import 'package:eisenhower_matrix/utils/private_credentials.dart';
import 'package:eisenhower_matrix/bloc/bloc.dart';
import 'package:eisenhower_matrix/repository/credential_models.dart';
import 'package:eisenhower_matrix/repository/matrix_repository.dart';
import 'package:eisenhower_matrix/repository/repository.dart';
import 'package:eisenhower_matrix/ui/screen/main_app.dart';
import 'package:eisenhower_matrix/ui/screen/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'ui/widget/common/error.dart';

void main() {
  // Comment import (import 'package:eisenhower_matrix/utils/private_credentials.dart';) in first line

  WidgetsFlutterBinding.ensureInitialized();

  BlocSupervisor.delegate = SimpleBlocDelegate();

  // Fill here your credentials
  final userRepository = UserRepository(
    userLocalRepository: HiveUserLocalRepository(),
    userSignInRepository: FirebaseUserSignInRepository(
//      Example
//      appleCredentials: AppleCredentials(),
//      gitHubCredentials: GitHubCredentials(
//        redirectUrl: 'your redirect url from firebase auth',
//        clientSecret: 'your github client secret',
//        clientId: 'your github client id'
//      ),
//      twitterCredentials: TwitterCredentials(),
      appleCredentials: AppleCredentials(),
      gitHubCredentials: githubPrivateCredentials,
      twitterCredentials: TwitterCredentials(),
    ),
  );
  runApp(
    AppInit(
      matrixRepository: MatrixRepository(
        matrixLocalRepository: HiveMatrixLocalRepository(),
        matrixWebRepository: FirebaseMatrixWebRepository(
          userRepository: userRepository,
        ),
        userRepository: userRepository,
      ),
      settingsRepository: SettingsRepository(
        settingsLocalRepository: HiveSettingsLocalRepository(),
        settingsWebRepository: FirebaseSettingsWebRepository(),
      ),
      userRepository: userRepository,
    ),
  );
}

class AppInit extends StatelessWidget {
  final MatrixRepository matrixRepository;
  final UserRepository userRepository;
  final SettingsRepository settingsRepository;

  const AppInit({
    Key key,
    @required this.matrixRepository,
    @required this.userRepository,
    @required this.settingsRepository,
  })  : assert(matrixRepository != null && userRepository != null && settingsRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformProvider(
      settings: PlatformSettingsData(
        iosUsesMaterialWidgets: true,
        platformStyle: PlatformStyleData(
          web: PlatformStyle.Cupertino,
        ),
      ),
      builder: (_) => MaterialApp(
        // ThemeMode.system doesn't work in web
        themeMode: isWeb ? ThemeMode.light : ThemeMode.system,
        theme: ThemeData(),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme: AppBarTheme(
            color: Color(0xf01d1d1d),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: MultiBlocProvider(
          providers: [
            BlocProvider<MatrixBloc>(
              create: (_) => MatrixBloc(
                matrixRepository: matrixRepository,
              ),
            ),
            BlocProvider<InitBloc>(
              create: (_) => InitBloc(
                userRepository: userRepository,
              ),
            ),
            BlocProvider<SettingsBloc>(
              create: (_) => SettingsBloc(
                settingsRepository: settingsRepository,
              ),
            ),
            BlocProvider<SignInBloc>(
              create: (_) => SignInBloc(
                userRepository: userRepository,
              ),
            ),
          ],
          child: UserInit(),
        ),
      ),
    );
  }
}

class UserInit extends StatefulWidget {
  @override
  _UserInitState createState() => _UserInitState();
}

class _UserInitState extends State<UserInit> {
  Widget _loadingScreen() => PlatformScaffold(
        appBar: PlatformAppBar(
          title: Text('Loading'),
        ),
        body: Center(
          child: PlatformCircularProgressIndicator(),
        ),
      );

  Widget _errorScreen(String message) => PlatformScaffold(
        appBar: PlatformAppBar(
          title: Text('Error screen'),
        ),
        body: Center(
          child: WidgetError(
            message: message,
          ),
        ),
      );

  @override
  void initState() {
    BlocProvider.of<InitBloc>(context).add(InitStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitBloc, InitState>(
      builder: (context, initState) {
        switch (initState.runtimeType) {
          case InitInitial:
            return _loadingScreen();
          case InitSignedIn:
            return MainAppScreen();
          case InitSignedOut:
            return SignInScreen();
          default:
            return _errorScreen('Unknown initState: $initState');
        }
      },
    );
  }
}
