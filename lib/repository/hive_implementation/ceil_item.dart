import 'package:eisenhower_matrix/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'ceil_item.g.dart';

@HiveType(typeId: 2)
class HiveCeilItem {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String id;
  @HiveField(2)
  final HiveCeilType ceilType;
  @HiveField(3)
  final int index;

  factory HiveCeilItem.fromCeilItem(CeilItem item) => HiveCeilItem(
        id: item.id,
        title: item.title,
        index: item.index,
        ceilType: () {
          switch (item.ceilType) {
            case CeilType.NotUrgentImportant:
              return HiveCeilType.NotUrgentImportant;
            case CeilType.NotUrgentNotImportant:
              return HiveCeilType.NotUrgentNotImportant;
            case CeilType.UrgentImportant:
              return HiveCeilType.UrgentImportant;
            case CeilType.UrgentNotImportant:
              return HiveCeilType.UrgentNotImportant;
          }
          return HiveCeilType.UrgentImportant;
        }(),
      );

  HiveCeilItem({
    @required this.title,
    @required this.id,
    @required this.ceilType,
    @required this.index,
  }) : assert(title != null && id != null && ceilType != null && index != null);

  CeilItem toCeilItem() => CeilItem(
        title: title,
        id: id,
        index: index,
        ceilType: () {
          switch (ceilType) {
            case HiveCeilType.NotUrgentImportant:
              return CeilType.NotUrgentImportant;
            case HiveCeilType.NotUrgentNotImportant:
              return CeilType.NotUrgentNotImportant;
            case HiveCeilType.UrgentImportant:
              return CeilType.UrgentImportant;
            case HiveCeilType.UrgentNotImportant:
              return CeilType.UrgentNotImportant;
          }
          return CeilType.UrgentImportant;
        }(),
      );
}

@HiveType(typeId: 3)
enum HiveCeilType {
  @HiveField(0)
  UrgentImportant,
  @HiveField(1)
  UrgentNotImportant,
  @HiveField(2)
  NotUrgentImportant,
  @HiveField(3)
  NotUrgentNotImportant,
}
