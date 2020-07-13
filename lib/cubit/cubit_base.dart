import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCubitObserver extends BlocObserver {
  @override
  void onTransition(Cubit cubit, Transition transition) {
    debugPrint('On transition: $transition');
    super.onTransition(cubit, transition);
  }
}
