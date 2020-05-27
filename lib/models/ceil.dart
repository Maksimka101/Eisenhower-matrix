import 'package:freezed_annotation/freezed_annotation.dart';

import 'ceil_item.dart';

part 'ceil.freezed.dart';

@freezed
abstract class Ceil with _$Ceil {
  const factory Ceil({@required CeilType type, @required List<CeilItem> items}) = _Ceil;
}

enum CeilType {
  UrgentImportant,
  UrgentNotImportant,
  NotUrgentImportant,
  NotUrgentNotImportant,
}
