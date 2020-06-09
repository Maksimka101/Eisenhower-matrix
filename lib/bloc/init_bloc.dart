import 'package:eisenhower_matrix/bloc/init_entity.dart';
import 'package:eisenhower_matrix/models/models.dart';
import 'package:eisenhower_matrix/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitBloc extends Bloc<InitEvent, InitState> {
  final UserRepository userRepository;

  InitBloc({@required this.userRepository}) : assert(userRepository != null) {
    userRepository.userStream.listen(_userStateListener);
  }

  void _userStateListener(User user) => add(InitFetchedUser(user: user));

  @override
  InitState get initialState => InitInitial();

  @override
  Stream<InitState> mapEventToState(InitEvent event) async* {
    switch (event.runtimeType) {
      case InitFetchedUser:
        yield* _mapInitFetchedUserToState(event);
        break;
      case InitStarted:
        yield* _mapInitStartedToState(event);
        break;
    }
  }

  Stream<InitState> _mapInitFetchedUserToState(InitFetchedUser fetchedUser) async* {
    yield InitInitial();
    await Future.delayed(Duration.zero);
    if (fetchedUser.user != null) {
      yield InitSignedIn();
    } else {
      yield InitSignedOut();
    }
  }

  Stream<InitState> _mapInitStartedToState(InitStarted event) async* {
    try {
      await userRepository.fetchUser();
    } catch (e) {
      yield InitSignedOut();
      debugPrint('User fetched with error: $e');
    }
  }
}
