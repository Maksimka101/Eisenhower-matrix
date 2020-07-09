// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SettingsTearOff {
  const _$SettingsTearOff();

  _Settings call(
      {CeilSettings ceilSettings = const CeilSettings(),
      @required DateTime lastChangeDate}) {
    return _Settings(
      ceilSettings: ceilSettings,
      lastChangeDate: lastChangeDate,
    );
  }
}

// ignore: unused_element
const $Settings = _$SettingsTearOff();

mixin _$Settings {
  CeilSettings get ceilSettings;
  DateTime get lastChangeDate;

  $SettingsCopyWith<Settings> get copyWith;
}

abstract class $SettingsCopyWith<$Res> {
  factory $SettingsCopyWith(Settings value, $Res Function(Settings) then) =
      _$SettingsCopyWithImpl<$Res>;
  $Res call({CeilSettings ceilSettings, DateTime lastChangeDate});

  $CeilSettingsCopyWith<$Res> get ceilSettings;
}

class _$SettingsCopyWithImpl<$Res> implements $SettingsCopyWith<$Res> {
  _$SettingsCopyWithImpl(this._value, this._then);

  final Settings _value;
  // ignore: unused_field
  final $Res Function(Settings) _then;

  @override
  $Res call({
    Object ceilSettings = freezed,
    Object lastChangeDate = freezed,
  }) {
    return _then(_value.copyWith(
      ceilSettings: ceilSettings == freezed
          ? _value.ceilSettings
          : ceilSettings as CeilSettings,
      lastChangeDate: lastChangeDate == freezed
          ? _value.lastChangeDate
          : lastChangeDate as DateTime,
    ));
  }

  @override
  $CeilSettingsCopyWith<$Res> get ceilSettings {
    if (_value.ceilSettings == null) {
      return null;
    }
    return $CeilSettingsCopyWith<$Res>(_value.ceilSettings, (value) {
      return _then(_value.copyWith(ceilSettings: value));
    });
  }
}

abstract class _$SettingsCopyWith<$Res> implements $SettingsCopyWith<$Res> {
  factory _$SettingsCopyWith(_Settings value, $Res Function(_Settings) then) =
      __$SettingsCopyWithImpl<$Res>;
  @override
  $Res call({CeilSettings ceilSettings, DateTime lastChangeDate});

  @override
  $CeilSettingsCopyWith<$Res> get ceilSettings;
}

class __$SettingsCopyWithImpl<$Res> extends _$SettingsCopyWithImpl<$Res>
    implements _$SettingsCopyWith<$Res> {
  __$SettingsCopyWithImpl(_Settings _value, $Res Function(_Settings) _then)
      : super(_value, (v) => _then(v as _Settings));

  @override
  _Settings get _value => super._value as _Settings;

  @override
  $Res call({
    Object ceilSettings = freezed,
    Object lastChangeDate = freezed,
  }) {
    return _then(_Settings(
      ceilSettings: ceilSettings == freezed
          ? _value.ceilSettings
          : ceilSettings as CeilSettings,
      lastChangeDate: lastChangeDate == freezed
          ? _value.lastChangeDate
          : lastChangeDate as DateTime,
    ));
  }
}

class _$_Settings implements _Settings {
  const _$_Settings(
      {this.ceilSettings = const CeilSettings(), @required this.lastChangeDate})
      : assert(ceilSettings != null),
        assert(lastChangeDate != null);

  @JsonKey(defaultValue: const CeilSettings())
  @override
  final CeilSettings ceilSettings;
  @override
  final DateTime lastChangeDate;

  @override
  String toString() {
    return 'Settings(ceilSettings: $ceilSettings, lastChangeDate: $lastChangeDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Settings &&
            (identical(other.ceilSettings, ceilSettings) ||
                const DeepCollectionEquality()
                    .equals(other.ceilSettings, ceilSettings)) &&
            (identical(other.lastChangeDate, lastChangeDate) ||
                const DeepCollectionEquality()
                    .equals(other.lastChangeDate, lastChangeDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(ceilSettings) ^
      const DeepCollectionEquality().hash(lastChangeDate);

  @override
  _$SettingsCopyWith<_Settings> get copyWith =>
      __$SettingsCopyWithImpl<_Settings>(this, _$identity);
}

abstract class _Settings implements Settings {
  const factory _Settings(
      {CeilSettings ceilSettings,
      @required DateTime lastChangeDate}) = _$_Settings;

  @override
  CeilSettings get ceilSettings;
  @override
  DateTime get lastChangeDate;
  @override
  _$SettingsCopyWith<_Settings> get copyWith;
}

class _$CeilSettingsTearOff {
  const _$CeilSettingsTearOff();

  _CeilSettings call(
      {Duration doneCeilDeleteDuration = const Duration(hours: 24)}) {
    return _CeilSettings(
      doneCeilDeleteDuration: doneCeilDeleteDuration,
    );
  }
}

// ignore: unused_element
const $CeilSettings = _$CeilSettingsTearOff();

mixin _$CeilSettings {
  Duration get doneCeilDeleteDuration;

  $CeilSettingsCopyWith<CeilSettings> get copyWith;
}

abstract class $CeilSettingsCopyWith<$Res> {
  factory $CeilSettingsCopyWith(
          CeilSettings value, $Res Function(CeilSettings) then) =
      _$CeilSettingsCopyWithImpl<$Res>;
  $Res call({Duration doneCeilDeleteDuration});
}

class _$CeilSettingsCopyWithImpl<$Res> implements $CeilSettingsCopyWith<$Res> {
  _$CeilSettingsCopyWithImpl(this._value, this._then);

  final CeilSettings _value;
  // ignore: unused_field
  final $Res Function(CeilSettings) _then;

  @override
  $Res call({
    Object doneCeilDeleteDuration = freezed,
  }) {
    return _then(_value.copyWith(
      doneCeilDeleteDuration: doneCeilDeleteDuration == freezed
          ? _value.doneCeilDeleteDuration
          : doneCeilDeleteDuration as Duration,
    ));
  }
}

abstract class _$CeilSettingsCopyWith<$Res>
    implements $CeilSettingsCopyWith<$Res> {
  factory _$CeilSettingsCopyWith(
          _CeilSettings value, $Res Function(_CeilSettings) then) =
      __$CeilSettingsCopyWithImpl<$Res>;
  @override
  $Res call({Duration doneCeilDeleteDuration});
}

class __$CeilSettingsCopyWithImpl<$Res> extends _$CeilSettingsCopyWithImpl<$Res>
    implements _$CeilSettingsCopyWith<$Res> {
  __$CeilSettingsCopyWithImpl(
      _CeilSettings _value, $Res Function(_CeilSettings) _then)
      : super(_value, (v) => _then(v as _CeilSettings));

  @override
  _CeilSettings get _value => super._value as _CeilSettings;

  @override
  $Res call({
    Object doneCeilDeleteDuration = freezed,
  }) {
    return _then(_CeilSettings(
      doneCeilDeleteDuration: doneCeilDeleteDuration == freezed
          ? _value.doneCeilDeleteDuration
          : doneCeilDeleteDuration as Duration,
    ));
  }
}

class _$_CeilSettings implements _CeilSettings {
  const _$_CeilSettings(
      {this.doneCeilDeleteDuration = const Duration(hours: 24)})
      : assert(doneCeilDeleteDuration != null);

  @JsonKey(defaultValue: const Duration(hours: 24))
  @override
  final Duration doneCeilDeleteDuration;

  @override
  String toString() {
    return 'CeilSettings(doneCeilDeleteDuration: $doneCeilDeleteDuration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CeilSettings &&
            (identical(other.doneCeilDeleteDuration, doneCeilDeleteDuration) ||
                const DeepCollectionEquality().equals(
                    other.doneCeilDeleteDuration, doneCeilDeleteDuration)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(doneCeilDeleteDuration);

  @override
  _$CeilSettingsCopyWith<_CeilSettings> get copyWith =>
      __$CeilSettingsCopyWithImpl<_CeilSettings>(this, _$identity);
}

abstract class _CeilSettings implements CeilSettings {
  const factory _CeilSettings({Duration doneCeilDeleteDuration}) =
      _$_CeilSettings;

  @override
  Duration get doneCeilDeleteDuration;
  @override
  _$CeilSettingsCopyWith<_CeilSettings> get copyWith;
}
