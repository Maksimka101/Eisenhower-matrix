// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {@required String id,
      @required String name,
      String photoUrl,
      @required SignInProvider signInProvider}) {
    return _User(
      id: id,
      name: name,
      photoUrl: photoUrl,
      signInProvider: signInProvider,
    );
  }
}

// ignore: unused_element
const $User = _$UserTearOff();

mixin _$User {
  String get id;
  String get name;
  String get photoUrl;
  SignInProvider get signInProvider;

  $UserCopyWith<User> get copyWith;
}

abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String id, String name, String photoUrl, SignInProvider signInProvider});
}

class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object photoUrl = freezed,
    Object signInProvider = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      photoUrl: photoUrl == freezed ? _value.photoUrl : photoUrl as String,
      signInProvider: signInProvider == freezed
          ? _value.signInProvider
          : signInProvider as SignInProvider,
    ));
  }
}

abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id, String name, String photoUrl, SignInProvider signInProvider});
}

class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object photoUrl = freezed,
    Object signInProvider = freezed,
  }) {
    return _then(_User(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      photoUrl: photoUrl == freezed ? _value.photoUrl : photoUrl as String,
      signInProvider: signInProvider == freezed
          ? _value.signInProvider
          : signInProvider as SignInProvider,
    ));
  }
}

class _$_User extends _User {
  _$_User(
      {@required this.id,
      @required this.name,
      this.photoUrl,
      @required this.signInProvider})
      : assert(id != null),
        assert(name != null),
        assert(signInProvider != null),
        super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final String photoUrl;
  @override
  final SignInProvider signInProvider;

  @override
  String toString() {
    return 'User(id: $id, name: $name, photoUrl: $photoUrl, signInProvider: $signInProvider)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.photoUrl, photoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.photoUrl, photoUrl)) &&
            (identical(other.signInProvider, signInProvider) ||
                const DeepCollectionEquality()
                    .equals(other.signInProvider, signInProvider)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(photoUrl) ^
      const DeepCollectionEquality().hash(signInProvider);

  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);
}

abstract class _User extends User {
  _User._() : super._();
  factory _User(
      {@required String id,
      @required String name,
      String photoUrl,
      @required SignInProvider signInProvider}) = _$_User;

  @override
  String get id;
  @override
  String get name;
  @override
  String get photoUrl;
  @override
  SignInProvider get signInProvider;
  @override
  _$UserCopyWith<_User> get copyWith;
}
