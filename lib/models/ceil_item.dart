import 'package:eisenhower_matrix/models/ceil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ceil_item.freezed.dart';

@freezed
abstract class CeilItem with _$CeilItem {
  const factory CeilItem(
      {@required String title,
      @nullable @required String id,
      @required int index,
      @required CeilType ceilType,
      @Default(DoneInfo()) DoneInfo doneInfo}) = _CeilItem;
}

@freezed
abstract class DoneInfo with _$DoneInfo {
  /// [doneAt] is a date where item marked as [done]. It's must be null when item is not [done]
  const factory DoneInfo({@Default(false) bool done, DateTime doneAt}) = _DoneInfo;
}
