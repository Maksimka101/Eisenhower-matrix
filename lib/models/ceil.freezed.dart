// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'ceil.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$CeilTearOff {
  const _$CeilTearOff();

  _Ceil call({@required CeilType type, @required List<CeilItem> items}) {
    return _Ceil(
      type: type,
      items: items,
    );
  }
}

// ignore: unused_element
const $Ceil = _$CeilTearOff();

mixin _$Ceil {
  CeilType get type;
  List<CeilItem> get items;

  $CeilCopyWith<Ceil> get copyWith;
}

abstract class $CeilCopyWith<$Res> {
  factory $CeilCopyWith(Ceil value, $Res Function(Ceil) then) =
      _$CeilCopyWithImpl<$Res>;
  $Res call({CeilType type, List<CeilItem> items});
}

class _$CeilCopyWithImpl<$Res> implements $CeilCopyWith<$Res> {
  _$CeilCopyWithImpl(this._value, this._then);

  final Ceil _value;
  // ignore: unused_field
  final $Res Function(Ceil) _then;

  @override
  $Res call({
    Object type = freezed,
    Object items = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed ? _value.type : type as CeilType,
      items: items == freezed ? _value.items : items as List<CeilItem>,
    ));
  }
}

abstract class _$CeilCopyWith<$Res> implements $CeilCopyWith<$Res> {
  factory _$CeilCopyWith(_Ceil value, $Res Function(_Ceil) then) =
      __$CeilCopyWithImpl<$Res>;
  @override
  $Res call({CeilType type, List<CeilItem> items});
}

class __$CeilCopyWithImpl<$Res> extends _$CeilCopyWithImpl<$Res>
    implements _$CeilCopyWith<$Res> {
  __$CeilCopyWithImpl(_Ceil _value, $Res Function(_Ceil) _then)
      : super(_value, (v) => _then(v as _Ceil));

  @override
  _Ceil get _value => super._value as _Ceil;

  @override
  $Res call({
    Object type = freezed,
    Object items = freezed,
  }) {
    return _then(_Ceil(
      type: type == freezed ? _value.type : type as CeilType,
      items: items == freezed ? _value.items : items as List<CeilItem>,
    ));
  }
}

class _$_Ceil implements _Ceil {
  const _$_Ceil({@required this.type, @required this.items})
      : assert(type != null),
        assert(items != null);

  @override
  final CeilType type;
  @override
  final List<CeilItem> items;

  @override
  String toString() {
    return 'Ceil(type: $type, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Ceil &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(items);

  @override
  _$CeilCopyWith<_Ceil> get copyWith =>
      __$CeilCopyWithImpl<_Ceil>(this, _$identity);
}

abstract class _Ceil implements Ceil {
  const factory _Ceil(
      {@required CeilType type, @required List<CeilItem> items}) = _$_Ceil;

  @override
  CeilType get type;
  @override
  List<CeilItem> get items;
  @override
  _$CeilCopyWith<_Ceil> get copyWith;
}
