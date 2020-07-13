import 'package:eisenhower_matrix/models/ceil_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'ceil.dart';

part 'matrix.freezed.dart';

@freezed
abstract class Matrix implements _$Matrix {
  Matrix._();

  factory Matrix.fromCeilItems(List<CeilItem> items) {
    final urgentImportant = <CeilItem>[];
    final notUrgentImportant = <CeilItem>[];
    final urgentNotImportant = <CeilItem>[];
    final notUrgentNotImportant = <CeilItem>[];
    for (final ceilItem in items) {
      switch (ceilItem.ceilType) {
        case CeilType.UrgentImportant:
          urgentImportant.add(ceilItem);
          break;
        case CeilType.UrgentNotImportant:
          urgentNotImportant.add(ceilItem);
          break;
        case CeilType.NotUrgentImportant:
          notUrgentImportant.add(ceilItem);
          break;
        case CeilType.NotUrgentNotImportant:
          notUrgentNotImportant.add(ceilItem);
          break;
      }
    }
    return Matrix(
      notUrgentAndNotImportant: Ceil(
        type: CeilType.NotUrgentNotImportant,
        items: notUrgentNotImportant,
      ),
      notUrgentAndImportant: Ceil(
        type: CeilType.NotUrgentImportant,
        items: notUrgentImportant,
      ),
      urgentAndImportant: Ceil(
        type: CeilType.UrgentImportant,
        items: urgentImportant,
      ),
      urgentAndNotImportant: Ceil(
        type: CeilType.UrgentNotImportant,
        items: urgentNotImportant,
      ),
    );
  }

  factory Matrix({
    @required Ceil urgentAndImportant,
    @required Ceil urgentAndNotImportant,
    @required Ceil notUrgentAndImportant,
    @required Ceil notUrgentAndNotImportant,
  }) = _Matrix;

  factory Matrix.empty() => Matrix.fromCeilItems([]);

  Matrix get sorted => () {
        notUrgentImportant.items.sort((f, s) => f.index.compareTo(s.index));
        urgentImportant.items.sort((f, s) => f.index.compareTo(s.index));
        notUrgentNotImportant.items.sort((f, s) => f.index.compareTo(s.index));
        urgentNotImportant.items.sort((f, s) => f.index.compareTo(s.index));
        return this;
      }();

  @late
  List<CeilItem> get allCeilItems => [
        ...urgentImportant.items,
        ...urgentNotImportant.items,
        ...notUrgentImportant.items,
        ...notUrgentNotImportant.items,
      ];
}
