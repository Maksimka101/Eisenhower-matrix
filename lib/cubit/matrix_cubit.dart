import 'package:cubit/cubit.dart';
import 'package:eisenhower_matrix/models/models.dart';
import 'package:eisenhower_matrix/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class MatrixCubit extends Cubit<MatrixState> {
  final MatrixRepository matrixRepository;

  MatrixCubit({@required this.matrixRepository})
      : assert(matrixRepository != null),
        super(MatrixInitial()) {
    matrixRepository.matrixStream.listen(_matrixStateListener);
  }

  void _matrixStateListener(Matrix matrix) {
    matrix.notUrgentAndImportant.items.sort((f, s) => f.index.compareTo(s.index));
    matrix.urgentAndImportant.items.sort((f, s) => f.index.compareTo(s.index));
    matrix.notUrgentAndNotImportant.items.sort((f, s) => f.index.compareTo(s.index));
    matrix.urgentAndNotImportant.items.sort((f, s) => f.index.compareTo(s.index));
    emit(MatrixFetched(matrix: matrix));
  }

  Future<void> matrixFetchLatest() async {
    await matrixRepository.fetchMatrix();
  }

  Future<void> matrixCeilItemSaved({@required CeilItem item}) async {
    await matrixRepository.saveCeilItem(item);
  }

  Future<void> matrixCeilItemDeleted({@required String itemId}) async {
    await matrixRepository.deleteCeilItem(itemId);
  }
}

abstract class MatrixState extends Equatable {
  @override
  List<Object> get props => [];
}

class MatrixInitial extends MatrixState {}

class MatrixFetched extends MatrixState {
  final Matrix matrix;

  MatrixFetched({@required this.matrix}) : assert(matrix != null);

  @override
  List<Object> get props => [matrix];
}
