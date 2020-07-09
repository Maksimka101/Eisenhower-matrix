import 'package:cubit/cubit.dart';
import 'package:eisenhower_matrix/models/models.dart';
import 'package:eisenhower_matrix/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'matrix_cubit.freezed.dart';

class MatrixCubit extends Cubit<MatrixState> {
  final MatrixRepository matrixRepository;
  final SettingsRepository settingsRepository;
  Duration _doneCeilDeleteDuration;

  MatrixCubit({@required this.matrixRepository, @required this.settingsRepository})
      : assert(matrixRepository != null && settingsRepository != null),
        super(MatrixState.initial()) {
    matrixRepository.matrixStream.listen(_matrixStateListener);
    settingsRepository.settingsStream.listen(_onSettingsChanged);
  }

  void _onSettingsChanged(Settings settings) {
    _doneCeilDeleteDuration = settings.ceilSettings.doneCeilDeleteDuration;
  }

  void _matrixStateListener(Matrix matrix) {
    if (_matrixContainsOutdatedDoneItem(matrix)) {
      var now = DateTime.now();
      for (final item in matrix.allCeilItems) {
        if (item.doneInfo.done && item.doneInfo.doneAt.difference(now) > _doneCeilDeleteDuration) {
          matrixCeilItemDeleted(itemId: item.id);
        }
      }
      return;
    }
    emit(MatrixState.fetched(matrix: matrix.sorted));
  }

  bool _matrixContainsOutdatedDoneItem(Matrix matrix) {
    if (_doneCeilDeleteDuration == null) return false;
    var now = DateTime.now();
    return matrix.allCeilItems.any((element) =>
        element.doneInfo.done && element.doneInfo.doneAt.difference(now) > _doneCeilDeleteDuration);
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

@freezed
abstract class MatrixState with _$MatrixState {
  const factory MatrixState.initial() = Initial;

  const factory MatrixState.fetched({@required Matrix matrix}) = Fetched;
}
