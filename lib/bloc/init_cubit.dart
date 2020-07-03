import 'package:cubit/cubit.dart';
import 'package:eisenhower_matrix/models/models.dart';
import 'package:eisenhower_matrix/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class InitCubit extends Cubit<InitState> {
  final UserRepository userRepository;

  InitCubit({@required this.userRepository})
      : assert(userRepository != null),
        super(InitInitial()) {
    userRepository.userStream.listen(_userFetched);
  }

  Future<void> _userFetched(User user) async {
    emit(InitInitial());
    await Future.delayed(Duration.zero);
    if (user != null) {
      emit(InitSignedIn());
    } else {
      emit(InitSignedOut());
    }
  }

  Future<void> initStarted() async {
    try {
      await userRepository.fetchUser();
    } catch (e) {
      emit(InitSignedOut());
      debugPrint('User fetched with error: $e');
    }
  }
}

abstract class InitState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitInitial extends InitState {}

class InitSignedIn extends InitState {}

class InitSignedOut extends InitState {}
