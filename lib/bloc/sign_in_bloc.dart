import 'package:eisenhower_matrix/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sign_in_entity.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserRepository userRepository;

  SignInBloc({@required this.userRepository}) : assert(userRepository != null);

  @override
  // TODO: implement initialState
  SignInState get initialState => throw UnimplementedError();

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
