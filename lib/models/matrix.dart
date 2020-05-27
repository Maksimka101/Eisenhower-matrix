import 'package:eisenhower_matrix/models/ceil_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'ceil.dart';

part 'matrix.freezed.dart';

@freezed
abstract class Matrix implements _$Matrix {
  Matrix._();

   factory Matrix({
    @required Ceil urgentAndImportant,
    @required Ceil urgentAndNotImportant,
    @required Ceil notUrgentAndImportant,
    @required Ceil notUrgentAndNotImportant,
  }) = _Matrix;

  @late
  List<CeilItem> get allCeilItems => [
        ...urgentAndImportant.items,
        ...urgentAndNotImportant.items,
        ...notUrgentAndImportant.items,
        ...notUrgentAndNotImportant.items,
      ];
}
