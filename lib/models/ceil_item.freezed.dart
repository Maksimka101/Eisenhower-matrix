// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'ceil_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$CeilItemTearOff {
  const _$CeilItemTearOff();

  _CeilItem call(
      {@required String title,
      @required @nullable String id,
      @required int index,
      @required CeilType ceilType,
      DoneInfo doneInfo = const DoneInfo()}) {
    return _CeilItem(
      title: title,
      id: id,
      index: index,
      ceilType: ceilType,
      doneInfo: doneInfo,
    );
  }
}

// ignore: unused_element
const $CeilItem = _$CeilItemTearOff();

mixin _$CeilItem {
  String get title;
  @nullable
  String get id;
  int get index;
  CeilType get ceilType;
  DoneInfo get doneInfo;

  $CeilItemCopyWith<CeilItem> get copyWith;
}

abstract class $CeilItemCopyWith<$Res> {
  factory $CeilItemCopyWith(CeilItem value, $Res Function(CeilItem) then) =
      _$CeilItemCopyWithImpl<$Res>;
  $Res call(
      {String title,
      @nullable String id,
      int index,
      CeilType ceilType,
      DoneInfo doneInfo});

  $DoneInfoCopyWith<$Res> get doneInfo;
}

class _$CeilItemCopyWithImpl<$Res> implements $CeilItemCopyWith<$Res> {
  _$CeilItemCopyWithImpl(this._value, this._then);

  final CeilItem _value;
  // ignore: unused_field
  final $Res Function(CeilItem) _then;

  @override
  $Res call({
    Object title = freezed,
    Object id = freezed,
    Object index = freezed,
    Object ceilType = freezed,
    Object doneInfo = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed ? _value.title : title as String,
      id: id == freezed ? _value.id : id as String,
      index: index == freezed ? _value.index : index as int,
      ceilType: ceilType == freezed ? _value.ceilType : ceilType as CeilType,
      doneInfo: doneInfo == freezed ? _value.doneInfo : doneInfo as DoneInfo,
    ));
  }

  @override
  $DoneInfoCopyWith<$Res> get doneInfo {
    if (_value.doneInfo == null) {
      return null;
    }
    return $DoneInfoCopyWith<$Res>(_value.doneInfo, (value) {
      return _then(_value.copyWith(doneInfo: value));
    });
  }
}

abstract class _$CeilItemCopyWith<$Res> implements $CeilItemCopyWith<$Res> {
  factory _$CeilItemCopyWith(_CeilItem value, $Res Function(_CeilItem) then) =
      __$CeilItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      @nullable String id,
      int index,
      CeilType ceilType,
      DoneInfo doneInfo});

  @override
  $DoneInfoCopyWith<$Res> get doneInfo;
}

class __$CeilItemCopyWithImpl<$Res> extends _$CeilItemCopyWithImpl<$Res>
    implements _$CeilItemCopyWith<$Res> {
  __$CeilItemCopyWithImpl(_CeilItem _value, $Res Function(_CeilItem) _then)
      : super(_value, (v) => _then(v as _CeilItem));

  @override
  _CeilItem get _value => super._value as _CeilItem;

  @override
  $Res call({
    Object title = freezed,
    Object id = freezed,
    Object index = freezed,
    Object ceilType = freezed,
    Object doneInfo = freezed,
  }) {
    return _then(_CeilItem(
      title: title == freezed ? _value.title : title as String,
      id: id == freezed ? _value.id : id as String,
      index: index == freezed ? _value.index : index as int,
      ceilType: ceilType == freezed ? _value.ceilType : ceilType as CeilType,
      doneInfo: doneInfo == freezed ? _value.doneInfo : doneInfo as DoneInfo,
    ));
  }
}

class _$_CeilItem implements _CeilItem {
  const _$_CeilItem(
      {@required this.title,
      @required @nullable this.id,
      @required this.index,
      @required this.ceilType,
      this.doneInfo = const DoneInfo()})
      : assert(title != null),
        assert(index != null),
        assert(ceilType != null),
        assert(doneInfo != null);

  @override
  final String title;
  @override
  @nullable
  final String id;
  @override
  final int index;
  @override
  final CeilType ceilType;
  @JsonKey(defaultValue: const DoneInfo())
  @override
  final DoneInfo doneInfo;

  @override
  String toString() {
    return 'CeilItem(title: $title, id: $id, index: $index, ceilType: $ceilType, doneInfo: $doneInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CeilItem &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)) &&
            (identical(other.ceilType, ceilType) ||
                const DeepCollectionEquality()
                    .equals(other.ceilType, ceilType)) &&
            (identical(other.doneInfo, doneInfo) ||
                const DeepCollectionEquality()
                    .equals(other.doneInfo, doneInfo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(index) ^
      const DeepCollectionEquality().hash(ceilType) ^
      const DeepCollectionEquality().hash(doneInfo);

  @override
  _$CeilItemCopyWith<_CeilItem> get copyWith =>
      __$CeilItemCopyWithImpl<_CeilItem>(this, _$identity);
}

abstract class _CeilItem implements CeilItem {
  const factory _CeilItem(
      {@required String title,
      @required @nullable String id,
      @required int index,
      @required CeilType ceilType,
      DoneInfo doneInfo}) = _$_CeilItem;

  @override
  String get title;
  @override
  @nullable
  String get id;
  @override
  int get index;
  @override
  CeilType get ceilType;
  @override
  DoneInfo get doneInfo;
  @override
  _$CeilItemCopyWith<_CeilItem> get copyWith;
}

class _$DoneInfoTearOff {
  const _$DoneInfoTearOff();

  _DoneInfo call({bool done = false, DateTime doneAt}) {
    return _DoneInfo(
      done: done,
      doneAt: doneAt,
    );
  }
}

// ignore: unused_element
const $DoneInfo = _$DoneInfoTearOff();

mixin _$DoneInfo {
  bool get done;
  DateTime get doneAt;

  $DoneInfoCopyWith<DoneInfo> get copyWith;
}

abstract class $DoneInfoCopyWith<$Res> {
  factory $DoneInfoCopyWith(DoneInfo value, $Res Function(DoneInfo) then) =
      _$DoneInfoCopyWithImpl<$Res>;
  $Res call({bool done, DateTime doneAt});
}

class _$DoneInfoCopyWithImpl<$Res> implements $DoneInfoCopyWith<$Res> {
  _$DoneInfoCopyWithImpl(this._value, this._then);

  final DoneInfo _value;
  // ignore: unused_field
  final $Res Function(DoneInfo) _then;

  @override
  $Res call({
    Object done = freezed,
    Object doneAt = freezed,
  }) {
    return _then(_value.copyWith(
      done: done == freezed ? _value.done : done as bool,
      doneAt: doneAt == freezed ? _value.doneAt : doneAt as DateTime,
    ));
  }
}

abstract class _$DoneInfoCopyWith<$Res> implements $DoneInfoCopyWith<$Res> {
  factory _$DoneInfoCopyWith(_DoneInfo value, $Res Function(_DoneInfo) then) =
      __$DoneInfoCopyWithImpl<$Res>;
  @override
  $Res call({bool done, DateTime doneAt});
}

class __$DoneInfoCopyWithImpl<$Res> extends _$DoneInfoCopyWithImpl<$Res>
    implements _$DoneInfoCopyWith<$Res> {
  __$DoneInfoCopyWithImpl(_DoneInfo _value, $Res Function(_DoneInfo) _then)
      : super(_value, (v) => _then(v as _DoneInfo));

  @override
  _DoneInfo get _value => super._value as _DoneInfo;

  @override
  $Res call({
    Object done = freezed,
    Object doneAt = freezed,
  }) {
    return _then(_DoneInfo(
      done: done == freezed ? _value.done : done as bool,
      doneAt: doneAt == freezed ? _value.doneAt : doneAt as DateTime,
    ));
  }
}

class _$_DoneInfo implements _DoneInfo {
  const _$_DoneInfo({this.done = false, this.doneAt}) : assert(done != null);

  @JsonKey(defaultValue: false)
  @override
  final bool done;
  @override
  final DateTime doneAt;

  @override
  String toString() {
    return 'DoneInfo(done: $done, doneAt: $doneAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DoneInfo &&
            (identical(other.done, done) ||
                const DeepCollectionEquality().equals(other.done, done)) &&
            (identical(other.doneAt, doneAt) ||
                const DeepCollectionEquality().equals(other.doneAt, doneAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(done) ^
      const DeepCollectionEquality().hash(doneAt);

  @override
  _$DoneInfoCopyWith<_DoneInfo> get copyWith =>
      __$DoneInfoCopyWithImpl<_DoneInfo>(this, _$identity);
}

abstract class _DoneInfo implements DoneInfo {
  const factory _DoneInfo({bool done, DateTime doneAt}) = _$_DoneInfo;

  @override
  bool get done;
  @override
  DateTime get doneAt;
  @override
  _$DoneInfoCopyWith<_DoneInfo> get copyWith;
}
