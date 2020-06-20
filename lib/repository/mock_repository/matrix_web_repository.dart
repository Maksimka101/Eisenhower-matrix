import 'dart:async';

import 'package:eisenhower_matrix/models/models.dart';
import 'package:eisenhower_matrix/repository/abstract/matrix_web_repository.dart';
import 'package:flutter/cupertino.dart';

class MockMatrixWebRepository extends MatrixWebRepository {
  Matrix matrix;
  final _matrixStream = StreamController<Matrix>.broadcast();

  MockMatrixWebRepository({@required this.matrix});

  @override
  Future<Matrix> deleteCeilItem(String itemId) async {
    matrix =
        Matrix.fromCeilItems(matrix.allCeilItems..removeWhere((element) => element.id == itemId));
    _matrixStream.sink.add(matrix);
    return matrix;
  }

  @override
  Future<void> dispose() async {}

  @override
  Future<Matrix> fetchMatrix() async {
    return matrix;
  }

  @override
  Stream<Matrix> get matrixStream => _matrixStream.stream;

  @override
  Future<Matrix> saveCeilItem(CeilItem item) async {
    matrix = Matrix.fromCeilItems(matrix.allCeilItems..add(item));
    _matrixStream.sink.add(matrix);
    return matrix;
  }
}
