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
      bool done}) = _CeilItem;
}
