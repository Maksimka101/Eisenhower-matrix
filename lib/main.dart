import 'package:eisenhower_matrix/cubit/cubit_base.dart';
import 'package:eisenhower_matrix/utils/connection.dart';
import 'package:eisenhower_matrix/utils/hive_utils.dart';
import 'package:eisenhower_matrix/utils/private_credentials.dart';
import 'package:eisenhower_matrix/repository/credential_models.dart';
import 'package:eisenhower_matrix/repository/matrix_repository.dart';
import 'package:eisenhower_matrix/repository/repository.dart';
import 'package:eisenhower_matrix/ui/screen/main_app.dart';
import 'package:eisenhower_matrix/ui/screen/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/init_cubit.dart';
import 'cubit/matrix_cubit.dart';
import 'cubit/settings_cubit.dart';
import 'cubit/sign_in_cubit.dart';
import 'ui/widget/common/platform/platform_app_bar.dart';
import 'ui/widget/common/platform/platform_circular_progress_indicator.dart';

Future<void> main() async {
  // Comment import (import 'package:eisenhower_matrix/utils/private_credentials.dart';) in first line

  WidgetsFlutterBinding.ensureInitialized();

  // todo: remove repository specific code from main
  // Avoid error on desktop
  await HiveUtils.init();

  Bloc.observer = CustomCubitObserver();

  // Fill here your credentials
  final userRepository = UserRepository(
    connection: ConnectivityConnection(),
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
        connection: ConnectivityConnection(),
        matrixLocalRepository: HiveMatrixLocalRepository(),
        matrixWebRepository: FirebaseMatrixWebRepository(
          userRepository: userRepository,
        ),
        userRepository: userRepository,
      ),
      settingsRepository: SettingsRepository(
        connection: ConnectivityConnection(),
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
  })  : assert(matrixRepository != null &&
            userRepository != null &&
            settingsRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
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
          BlocProvider<InitCubit>(
            create: (_) => InitCubit(userRepository: userRepository),
          ),
          BlocProvider<MatrixCubit>(
            create: (_) => MatrixCubit(
              settingsRepository: settingsRepository,
              matrixRepository: matrixRepository,
            ),
          ),
          BlocProvider<SettingsCubit>(
            create: (_) => SettingsCubit(
              settingsRepository: settingsRepository,
            ),
          ),
          BlocProvider<SignInCubit>(
            create: (_) => SignInCubit(
              userRepository: userRepository,
            ),
          )
        ],
        child: UserInit(),
      ),
    );
  }
}

class UserInit extends StatefulWidget {
  @override
  _UserInitState createState() => _UserInitState();
}

class _UserInitState extends State<UserInit> {
  Widget _loadingScreen() => Scaffold(
        appBar: PlatformAppBar(
          title: Text('Loading'),
        ),
        body: Center(
          child: PlatformCircularProgressIndicator(),
        ),
      );

  @override
  void initState() {
    context.bloc<InitCubit>().initStarted();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitCubit, InitState>(
      builder: (context, initState) => initState.when<Widget>(
        initial: _loadingScreen,
        signedIn: () => MainAppScreen(),
        signedOut: () => SignInScreen(),
      ),
    );
  }
}
