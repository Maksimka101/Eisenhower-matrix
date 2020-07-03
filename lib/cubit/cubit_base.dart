import 'package:cubit/cubit.dart';
import 'package:flutter/cupertino.dart';

class CustomCubitObserver extends CubitObserver {
  @override
  void onTransition(Cubit cubit, Transition transition) {
    debugPrint('On transition: $transition');
    super.onTransition(cubit, transition);
  }
}
