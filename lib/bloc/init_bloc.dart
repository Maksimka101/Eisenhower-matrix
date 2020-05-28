import 'package:eisenhower_matrix/bloc/init_entity.dart';
import 'package:eisenhower_matrix/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitBloc extends Bloc<InitEvent, InitState> {
  final UserRepository userRepository;

  InitBloc({@required this.userRepository}) : assert(userRepository != null);

  @override
  // TODO: implement initialState
  InitState get initialState => throw UnimplementedError();

  @override
  Stream<InitState> mapEventToState(InitEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
