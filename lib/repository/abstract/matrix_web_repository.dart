import 'package:eisenhower_matrix/models/models.dart';

/// Used to load data from web
abstract class MatrixWebRepository {
  /// Stream with matrix state
  Stream<Matrix> get matrixStream;

  /// Subscribe on matrix changing if necessary
  /// Load last matrix state and push it to stream
  Future<Matrix> fetchMatrix();

  /// Create ceil item if id is null else update existing item
  /// On success return matrix state and add equal matrix to a [matrixStream]
  Future<Matrix> saveCeilItem(CeilItem item);

  /// On success return matrix state and add equal matrix to a [matrixStream]
  Future<Matrix> deleteCeilItem(String itemId);

  /// Free all resources
  Future<void> dispose();
}
