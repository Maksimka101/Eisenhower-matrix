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
      bool done = false}) {
    return _CeilItem(
      title: title,
      id: id,
      index: index,
      ceilType: ceilType,
      done: done,
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
  bool get done;

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
      bool done});
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
    Object done = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed ? _value.title : title as String,
      id: id == freezed ? _value.id : id as String,
      index: index == freezed ? _value.index : index as int,
      ceilType: ceilType == freezed ? _value.ceilType : ceilType as CeilType,
      done: done == freezed ? _value.done : done as bool,
    ));
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
      bool done});
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
    Object done = freezed,
  }) {
    return _then(_CeilItem(
      title: title == freezed ? _value.title : title as String,
      id: id == freezed ? _value.id : id as String,
      index: index == freezed ? _value.index : index as int,
      ceilType: ceilType == freezed ? _value.ceilType : ceilType as CeilType,
      done: done == freezed ? _value.done : done as bool,
    ));
  }
}

class _$_CeilItem implements _CeilItem {
  const _$_CeilItem(
      {@required this.title,
      @required @nullable this.id,
      @required this.index,
      @required this.ceilType,
      this.done = false})
      : assert(title != null),
        assert(index != null),
        assert(ceilType != null),
        assert(done != null);

  @override
  final String title;
  @override
  @nullable
  final String id;
  @override
  final int index;
  @override
  final CeilType ceilType;
  @JsonKey(defaultValue: false)
  @override
  final bool done;

  @override
  String toString() {
    return 'CeilItem(title: $title, id: $id, index: $index, ceilType: $ceilType, done: $done)';
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
            (identical(other.done, done) ||
                const DeepCollectionEquality().equals(other.done, done)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(index) ^
      const DeepCollectionEquality().hash(ceilType) ^
      const DeepCollectionEquality().hash(done);

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
      bool done}) = _$_CeilItem;

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
  bool get done;
  @override
  _$CeilItemCopyWith<_CeilItem> get copyWith;
}
