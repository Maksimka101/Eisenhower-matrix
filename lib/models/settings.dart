import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings.freezed.dart';

@freezed
abstract class Settings with _$Settings {
  const factory Settings(
      {@Default(CeilSettings()) CeilSettings ceilSettings,
      @required DateTime lastChangeDate}) = _Settings;
}

@freezed
abstract class CeilSettings with _$CeilSettings {
  /// [doneCeilDeleteDuration] a period after which you must delete ceil item
  const factory CeilSettings({
    @Default(Duration(hours: 24)) Duration doneCeilDeleteDuration,
  }) = _CeilSettings;
}
