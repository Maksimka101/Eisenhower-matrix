import 'package:cubit/cubit.dart';
import 'package:eisenhower_matrix/models/models.dart';
import 'package:eisenhower_matrix/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'init_cubit.freezed.dart';

class InitCubit extends Cubit<InitState> {
  final UserRepository userRepository;

  InitCubit({@required this.userRepository})
      : assert(userRepository != null),
        super(InitState.initial()) {
    userRepository.userStream.listen(_userFetched);
  }

  Future<void> _userFetched(User user) async {
    emit(InitState.initial());
    await Future.delayed(Duration.zero);
    if (user != null) {
      emit(InitState.signedIn());
    } else {
      emit(InitState.signedOut());
    }
  }

  Future<void> initStarted() async {
    try {
      await userRepository.fetchUser();
    } catch (e) {
      emit(InitState.signedOut());
      debugPrint('User fetched with error: $e');
    }
  }
}

@freezed
abstract class InitState with _$InitState {
  const factory InitState.initial() = Initial;

  const factory InitState.signedIn() = SignedIn;

  const factory InitState.signedOut() = SignedOut;
}
