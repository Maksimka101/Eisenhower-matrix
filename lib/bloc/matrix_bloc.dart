import 'package:eisenhower_matrix/bloc/matrix_entity.dart';
import 'package:eisenhower_matrix/models/models.dart';
import 'package:eisenhower_matrix/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatrixBloc extends Bloc<MatrixEvent, MatrixState> {
  final MatrixRepository matrixRepository;

  MatrixBloc({@required this.matrixRepository}) : assert(matrixRepository != null) {
    matrixRepository.matrixStream.listen(_matrixStateListener);
  }

  void _matrixStateListener(Matrix matrix) => add(MatrixFetchedTransition(matrix: matrix));

  @override
  MatrixState get initialState => MatrixInitial();

  @override
  Stream<MatrixState> mapEventToState(MatrixEvent event) async* {
    switch (event.runtimeType) {
      case MatrixFetchedTransition:
        yield MatrixFetched(matrix: (event as MatrixFetchedTransition).matrix);
        break;
      case MatrixLatestFetched:
        yield* _mapMatrixFetchLatestToState();
        break;
      case MatrixCeilItemSaved:
        yield* _mapMatrixCeilItemSavedToState(event);
        break;
      case MatrixCeilItemDeleted:
        yield* _mapMatrixCeilItemDeletedToState(event);
        break;
    }
  }

  Stream<MatrixState> _mapMatrixFetchLatestToState() async* {
    await matrixRepository.fetchMatrix();
  }

  Stream<MatrixState> _mapMatrixCeilItemSavedToState(MatrixCeilItemSaved event) async* {
    await matrixRepository.saveCeilItem(event.item);
  }

  Stream<MatrixState> _mapMatrixCeilItemDeletedToState(MatrixCeilItemDeleted event) async* {
    await matrixRepository.deleteCeilItem(event.itemId);
  }
}
