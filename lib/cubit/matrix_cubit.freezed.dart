// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'matrix_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$MatrixStateTearOff {
  const _$MatrixStateTearOff();

  Initial initial() {
    return const Initial();
  }

  Fetched fetched({@required Matrix matrix}) {
    return Fetched(
      matrix: matrix,
    );
  }
}

// ignore: unused_element
const $MatrixState = _$MatrixStateTearOff();

mixin _$MatrixState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result fetched(Matrix matrix),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result fetched(Matrix matrix),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result fetched(Fetched value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result fetched(Fetched value),
    @required Result orElse(),
  });
}

abstract class $MatrixStateCopyWith<$Res> {
  factory $MatrixStateCopyWith(
          MatrixState value, $Res Function(MatrixState) then) =
      _$MatrixStateCopyWithImpl<$Res>;
}

class _$MatrixStateCopyWithImpl<$Res> implements $MatrixStateCopyWith<$Res> {
  _$MatrixStateCopyWithImpl(this._value, this._then);

  final MatrixState _value;
  // ignore: unused_field
  final $Res Function(MatrixState) _then;
}

abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

class _$InitialCopyWithImpl<$Res> extends _$MatrixStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

class _$Initial with DiagnosticableTreeMixin implements Initial {
  const _$Initial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MatrixState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'MatrixState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result fetched(Matrix matrix),
  }) {
    assert(initial != null);
    assert(fetched != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result fetched(Matrix matrix),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result fetched(Fetched value),
  }) {
    assert(initial != null);
    assert(fetched != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result fetched(Fetched value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements MatrixState {
  const factory Initial() = _$Initial;
}

abstract class $FetchedCopyWith<$Res> {
  factory $FetchedCopyWith(Fetched value, $Res Function(Fetched) then) =
      _$FetchedCopyWithImpl<$Res>;
  $Res call({Matrix matrix});

  $MatrixCopyWith<$Res> get matrix;
}

class _$FetchedCopyWithImpl<$Res> extends _$MatrixStateCopyWithImpl<$Res>
    implements $FetchedCopyWith<$Res> {
  _$FetchedCopyWithImpl(Fetched _value, $Res Function(Fetched) _then)
      : super(_value, (v) => _then(v as Fetched));

  @override
  Fetched get _value => super._value as Fetched;

  @override
  $Res call({
    Object matrix = freezed,
  }) {
    return _then(Fetched(
      matrix: matrix == freezed ? _value.matrix : matrix as Matrix,
    ));
  }

  @override
  $MatrixCopyWith<$Res> get matrix {
    if (_value.matrix == null) {
      return null;
    }
    return $MatrixCopyWith<$Res>(_value.matrix, (value) {
      return _then(_value.copyWith(matrix: value));
    });
  }
}

class _$Fetched with DiagnosticableTreeMixin implements Fetched {
  const _$Fetched({@required this.matrix}) : assert(matrix != null);

  @override
  final Matrix matrix;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MatrixState.fetched(matrix: $matrix)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MatrixState.fetched'))
      ..add(DiagnosticsProperty('matrix', matrix));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Fetched &&
            (identical(other.matrix, matrix) ||
                const DeepCollectionEquality().equals(other.matrix, matrix)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(matrix);

  @override
  $FetchedCopyWith<Fetched> get copyWith =>
      _$FetchedCopyWithImpl<Fetched>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result fetched(Matrix matrix),
  }) {
    assert(initial != null);
    assert(fetched != null);
    return fetched(matrix);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result fetched(Matrix matrix),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetched != null) {
      return fetched(matrix);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result fetched(Fetched value),
  }) {
    assert(initial != null);
    assert(fetched != null);
    return fetched(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result fetched(Fetched value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetched != null) {
      return fetched(this);
    }
    return orElse();
  }
}

abstract class Fetched implements MatrixState {
  const factory Fetched({@required Matrix matrix}) = _$Fetched;

  Matrix get matrix;
  $FetchedCopyWith<Fetched> get copyWith;
}
