import 'package:eisenhower_matrix/models/ceil_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'ceil.dart';

part 'matrix.freezed.dart';

@freezed
abstract class Matrix implements _$Matrix {
  Matrix._();

  factory Matrix.fromCeilItems(List<CeilItem> items, [bool sort = true]) {
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
    if (sort) {
      return Matrix.sort(
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
    } else {
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
  }

  factory Matrix({
    @required Ceil urgentAndImportant,
    @required Ceil urgentAndNotImportant,
    @required Ceil notUrgentAndImportant,
    @required Ceil notUrgentAndNotImportant,
  }) = _Matrix;

  factory Matrix.sort({
    @required Ceil urgentAndImportant,
    @required Ceil urgentAndNotImportant,
    @required Ceil notUrgentAndImportant,
    @required Ceil notUrgentAndNotImportant,
  }) {
    return Matrix(
      urgentAndNotImportant: urgentAndNotImportant.copyWith.call(
        items: urgentAndNotImportant.items
          ..sort(
            (f, s) => f.index.compareTo(s.index),
          ),
      ),
      urgentAndImportant: urgentAndImportant.copyWith.call(
        items: urgentAndImportant.items
          ..sort(
            (f, s) => f.index.compareTo(s.index),
          ),
      ),
      notUrgentAndImportant: notUrgentAndImportant.copyWith.call(
        items: notUrgentAndImportant.items
          ..sort(
            (f, s) => f.index.compareTo(s.index),
          ),
      ),
      notUrgentAndNotImportant: notUrgentAndNotImportant.copyWith.call(
        items: notUrgentAndNotImportant.items
          ..sort(
            (f, s) => f.index.compareTo(s.index),
          ),
      ),
    );
  }

  factory Matrix.empty() => Matrix.fromCeilItems([]);

  @late
  List<CeilItem> get allCeilItems => [
        ...urgentAndImportant.items,
        ...urgentAndNotImportant.items,
        ...notUrgentAndImportant.items,
        ...notUrgentAndNotImportant.items,
      ];
}
