import 'package:eisenhower_matrix/bloc/matrix_entity.dart';
import 'package:eisenhower_matrix/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatrixBloc extends Bloc<MatrixEvent, MatrixState> {
  final MatrixRepository matrixRepository;

  MatrixBloc({@required this.matrixRepository}) : assert(matrixRepository != null);

  @override
  // TODO: implement initialState
  MatrixState get initialState => throw UnimplementedError();

  @override
  Stream<MatrixState> mapEventToState(MatrixEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
