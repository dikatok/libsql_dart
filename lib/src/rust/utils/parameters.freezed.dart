// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parameters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ParamValue {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int field0) integer,
    required TResult Function(double field0) real,
    required TResult Function(String field0) text,
    required TResult Function(Uint8List field0) blob,
    required TResult Function() null_,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int field0)? integer,
    TResult? Function(double field0)? real,
    TResult? Function(String field0)? text,
    TResult? Function(Uint8List field0)? blob,
    TResult? Function()? null_,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int field0)? integer,
    TResult Function(double field0)? real,
    TResult Function(String field0)? text,
    TResult Function(Uint8List field0)? blob,
    TResult Function()? null_,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParamValue_Integer value) integer,
    required TResult Function(ParamValue_Real value) real,
    required TResult Function(ParamValue_Text value) text,
    required TResult Function(ParamValue_Blob value) blob,
    required TResult Function(ParamValue_Null value) null_,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParamValue_Integer value)? integer,
    TResult? Function(ParamValue_Real value)? real,
    TResult? Function(ParamValue_Text value)? text,
    TResult? Function(ParamValue_Blob value)? blob,
    TResult? Function(ParamValue_Null value)? null_,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParamValue_Integer value)? integer,
    TResult Function(ParamValue_Real value)? real,
    TResult Function(ParamValue_Text value)? text,
    TResult Function(ParamValue_Blob value)? blob,
    TResult Function(ParamValue_Null value)? null_,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParamValueCopyWith<$Res> {
  factory $ParamValueCopyWith(
          ParamValue value, $Res Function(ParamValue) then) =
      _$ParamValueCopyWithImpl<$Res, ParamValue>;
}

/// @nodoc
class _$ParamValueCopyWithImpl<$Res, $Val extends ParamValue>
    implements $ParamValueCopyWith<$Res> {
  _$ParamValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ParamValue
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ParamValue_IntegerImplCopyWith<$Res> {
  factory _$$ParamValue_IntegerImplCopyWith(_$ParamValue_IntegerImpl value,
          $Res Function(_$ParamValue_IntegerImpl) then) =
      __$$ParamValue_IntegerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int field0});
}

/// @nodoc
class __$$ParamValue_IntegerImplCopyWithImpl<$Res>
    extends _$ParamValueCopyWithImpl<$Res, _$ParamValue_IntegerImpl>
    implements _$$ParamValue_IntegerImplCopyWith<$Res> {
  __$$ParamValue_IntegerImplCopyWithImpl(_$ParamValue_IntegerImpl _value,
      $Res Function(_$ParamValue_IntegerImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParamValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$ParamValue_IntegerImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ParamValue_IntegerImpl extends ParamValue_Integer {
  const _$ParamValue_IntegerImpl(this.field0) : super._();

  @override
  final int field0;

  @override
  String toString() {
    return 'ParamValue.integer(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParamValue_IntegerImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  /// Create a copy of ParamValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParamValue_IntegerImplCopyWith<_$ParamValue_IntegerImpl> get copyWith =>
      __$$ParamValue_IntegerImplCopyWithImpl<_$ParamValue_IntegerImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int field0) integer,
    required TResult Function(double field0) real,
    required TResult Function(String field0) text,
    required TResult Function(Uint8List field0) blob,
    required TResult Function() null_,
  }) {
    return integer(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int field0)? integer,
    TResult? Function(double field0)? real,
    TResult? Function(String field0)? text,
    TResult? Function(Uint8List field0)? blob,
    TResult? Function()? null_,
  }) {
    return integer?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int field0)? integer,
    TResult Function(double field0)? real,
    TResult Function(String field0)? text,
    TResult Function(Uint8List field0)? blob,
    TResult Function()? null_,
    required TResult orElse(),
  }) {
    if (integer != null) {
      return integer(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParamValue_Integer value) integer,
    required TResult Function(ParamValue_Real value) real,
    required TResult Function(ParamValue_Text value) text,
    required TResult Function(ParamValue_Blob value) blob,
    required TResult Function(ParamValue_Null value) null_,
  }) {
    return integer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParamValue_Integer value)? integer,
    TResult? Function(ParamValue_Real value)? real,
    TResult? Function(ParamValue_Text value)? text,
    TResult? Function(ParamValue_Blob value)? blob,
    TResult? Function(ParamValue_Null value)? null_,
  }) {
    return integer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParamValue_Integer value)? integer,
    TResult Function(ParamValue_Real value)? real,
    TResult Function(ParamValue_Text value)? text,
    TResult Function(ParamValue_Blob value)? blob,
    TResult Function(ParamValue_Null value)? null_,
    required TResult orElse(),
  }) {
    if (integer != null) {
      return integer(this);
    }
    return orElse();
  }
}

abstract class ParamValue_Integer extends ParamValue {
  const factory ParamValue_Integer(final int field0) = _$ParamValue_IntegerImpl;
  const ParamValue_Integer._() : super._();

  int get field0;

  /// Create a copy of ParamValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParamValue_IntegerImplCopyWith<_$ParamValue_IntegerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ParamValue_RealImplCopyWith<$Res> {
  factory _$$ParamValue_RealImplCopyWith(_$ParamValue_RealImpl value,
          $Res Function(_$ParamValue_RealImpl) then) =
      __$$ParamValue_RealImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double field0});
}

/// @nodoc
class __$$ParamValue_RealImplCopyWithImpl<$Res>
    extends _$ParamValueCopyWithImpl<$Res, _$ParamValue_RealImpl>
    implements _$$ParamValue_RealImplCopyWith<$Res> {
  __$$ParamValue_RealImplCopyWithImpl(
      _$ParamValue_RealImpl _value, $Res Function(_$ParamValue_RealImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParamValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$ParamValue_RealImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$ParamValue_RealImpl extends ParamValue_Real {
  const _$ParamValue_RealImpl(this.field0) : super._();

  @override
  final double field0;

  @override
  String toString() {
    return 'ParamValue.real(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParamValue_RealImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  /// Create a copy of ParamValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParamValue_RealImplCopyWith<_$ParamValue_RealImpl> get copyWith =>
      __$$ParamValue_RealImplCopyWithImpl<_$ParamValue_RealImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int field0) integer,
    required TResult Function(double field0) real,
    required TResult Function(String field0) text,
    required TResult Function(Uint8List field0) blob,
    required TResult Function() null_,
  }) {
    return real(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int field0)? integer,
    TResult? Function(double field0)? real,
    TResult? Function(String field0)? text,
    TResult? Function(Uint8List field0)? blob,
    TResult? Function()? null_,
  }) {
    return real?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int field0)? integer,
    TResult Function(double field0)? real,
    TResult Function(String field0)? text,
    TResult Function(Uint8List field0)? blob,
    TResult Function()? null_,
    required TResult orElse(),
  }) {
    if (real != null) {
      return real(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParamValue_Integer value) integer,
    required TResult Function(ParamValue_Real value) real,
    required TResult Function(ParamValue_Text value) text,
    required TResult Function(ParamValue_Blob value) blob,
    required TResult Function(ParamValue_Null value) null_,
  }) {
    return real(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParamValue_Integer value)? integer,
    TResult? Function(ParamValue_Real value)? real,
    TResult? Function(ParamValue_Text value)? text,
    TResult? Function(ParamValue_Blob value)? blob,
    TResult? Function(ParamValue_Null value)? null_,
  }) {
    return real?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParamValue_Integer value)? integer,
    TResult Function(ParamValue_Real value)? real,
    TResult Function(ParamValue_Text value)? text,
    TResult Function(ParamValue_Blob value)? blob,
    TResult Function(ParamValue_Null value)? null_,
    required TResult orElse(),
  }) {
    if (real != null) {
      return real(this);
    }
    return orElse();
  }
}

abstract class ParamValue_Real extends ParamValue {
  const factory ParamValue_Real(final double field0) = _$ParamValue_RealImpl;
  const ParamValue_Real._() : super._();

  double get field0;

  /// Create a copy of ParamValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParamValue_RealImplCopyWith<_$ParamValue_RealImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ParamValue_TextImplCopyWith<$Res> {
  factory _$$ParamValue_TextImplCopyWith(_$ParamValue_TextImpl value,
          $Res Function(_$ParamValue_TextImpl) then) =
      __$$ParamValue_TextImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String field0});
}

/// @nodoc
class __$$ParamValue_TextImplCopyWithImpl<$Res>
    extends _$ParamValueCopyWithImpl<$Res, _$ParamValue_TextImpl>
    implements _$$ParamValue_TextImplCopyWith<$Res> {
  __$$ParamValue_TextImplCopyWithImpl(
      _$ParamValue_TextImpl _value, $Res Function(_$ParamValue_TextImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParamValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$ParamValue_TextImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ParamValue_TextImpl extends ParamValue_Text {
  const _$ParamValue_TextImpl(this.field0) : super._();

  @override
  final String field0;

  @override
  String toString() {
    return 'ParamValue.text(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParamValue_TextImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  /// Create a copy of ParamValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParamValue_TextImplCopyWith<_$ParamValue_TextImpl> get copyWith =>
      __$$ParamValue_TextImplCopyWithImpl<_$ParamValue_TextImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int field0) integer,
    required TResult Function(double field0) real,
    required TResult Function(String field0) text,
    required TResult Function(Uint8List field0) blob,
    required TResult Function() null_,
  }) {
    return text(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int field0)? integer,
    TResult? Function(double field0)? real,
    TResult? Function(String field0)? text,
    TResult? Function(Uint8List field0)? blob,
    TResult? Function()? null_,
  }) {
    return text?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int field0)? integer,
    TResult Function(double field0)? real,
    TResult Function(String field0)? text,
    TResult Function(Uint8List field0)? blob,
    TResult Function()? null_,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParamValue_Integer value) integer,
    required TResult Function(ParamValue_Real value) real,
    required TResult Function(ParamValue_Text value) text,
    required TResult Function(ParamValue_Blob value) blob,
    required TResult Function(ParamValue_Null value) null_,
  }) {
    return text(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParamValue_Integer value)? integer,
    TResult? Function(ParamValue_Real value)? real,
    TResult? Function(ParamValue_Text value)? text,
    TResult? Function(ParamValue_Blob value)? blob,
    TResult? Function(ParamValue_Null value)? null_,
  }) {
    return text?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParamValue_Integer value)? integer,
    TResult Function(ParamValue_Real value)? real,
    TResult Function(ParamValue_Text value)? text,
    TResult Function(ParamValue_Blob value)? blob,
    TResult Function(ParamValue_Null value)? null_,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this);
    }
    return orElse();
  }
}

abstract class ParamValue_Text extends ParamValue {
  const factory ParamValue_Text(final String field0) = _$ParamValue_TextImpl;
  const ParamValue_Text._() : super._();

  String get field0;

  /// Create a copy of ParamValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParamValue_TextImplCopyWith<_$ParamValue_TextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ParamValue_BlobImplCopyWith<$Res> {
  factory _$$ParamValue_BlobImplCopyWith(_$ParamValue_BlobImpl value,
          $Res Function(_$ParamValue_BlobImpl) then) =
      __$$ParamValue_BlobImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Uint8List field0});
}

/// @nodoc
class __$$ParamValue_BlobImplCopyWithImpl<$Res>
    extends _$ParamValueCopyWithImpl<$Res, _$ParamValue_BlobImpl>
    implements _$$ParamValue_BlobImplCopyWith<$Res> {
  __$$ParamValue_BlobImplCopyWithImpl(
      _$ParamValue_BlobImpl _value, $Res Function(_$ParamValue_BlobImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParamValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$ParamValue_BlobImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc

class _$ParamValue_BlobImpl extends ParamValue_Blob {
  const _$ParamValue_BlobImpl(this.field0) : super._();

  @override
  final Uint8List field0;

  @override
  String toString() {
    return 'ParamValue.blob(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParamValue_BlobImpl &&
            const DeepCollectionEquality().equals(other.field0, field0));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(field0));

  /// Create a copy of ParamValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParamValue_BlobImplCopyWith<_$ParamValue_BlobImpl> get copyWith =>
      __$$ParamValue_BlobImplCopyWithImpl<_$ParamValue_BlobImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int field0) integer,
    required TResult Function(double field0) real,
    required TResult Function(String field0) text,
    required TResult Function(Uint8List field0) blob,
    required TResult Function() null_,
  }) {
    return blob(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int field0)? integer,
    TResult? Function(double field0)? real,
    TResult? Function(String field0)? text,
    TResult? Function(Uint8List field0)? blob,
    TResult? Function()? null_,
  }) {
    return blob?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int field0)? integer,
    TResult Function(double field0)? real,
    TResult Function(String field0)? text,
    TResult Function(Uint8List field0)? blob,
    TResult Function()? null_,
    required TResult orElse(),
  }) {
    if (blob != null) {
      return blob(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParamValue_Integer value) integer,
    required TResult Function(ParamValue_Real value) real,
    required TResult Function(ParamValue_Text value) text,
    required TResult Function(ParamValue_Blob value) blob,
    required TResult Function(ParamValue_Null value) null_,
  }) {
    return blob(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParamValue_Integer value)? integer,
    TResult? Function(ParamValue_Real value)? real,
    TResult? Function(ParamValue_Text value)? text,
    TResult? Function(ParamValue_Blob value)? blob,
    TResult? Function(ParamValue_Null value)? null_,
  }) {
    return blob?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParamValue_Integer value)? integer,
    TResult Function(ParamValue_Real value)? real,
    TResult Function(ParamValue_Text value)? text,
    TResult Function(ParamValue_Blob value)? blob,
    TResult Function(ParamValue_Null value)? null_,
    required TResult orElse(),
  }) {
    if (blob != null) {
      return blob(this);
    }
    return orElse();
  }
}

abstract class ParamValue_Blob extends ParamValue {
  const factory ParamValue_Blob(final Uint8List field0) = _$ParamValue_BlobImpl;
  const ParamValue_Blob._() : super._();

  Uint8List get field0;

  /// Create a copy of ParamValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParamValue_BlobImplCopyWith<_$ParamValue_BlobImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ParamValue_NullImplCopyWith<$Res> {
  factory _$$ParamValue_NullImplCopyWith(_$ParamValue_NullImpl value,
          $Res Function(_$ParamValue_NullImpl) then) =
      __$$ParamValue_NullImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ParamValue_NullImplCopyWithImpl<$Res>
    extends _$ParamValueCopyWithImpl<$Res, _$ParamValue_NullImpl>
    implements _$$ParamValue_NullImplCopyWith<$Res> {
  __$$ParamValue_NullImplCopyWithImpl(
      _$ParamValue_NullImpl _value, $Res Function(_$ParamValue_NullImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParamValue
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ParamValue_NullImpl extends ParamValue_Null {
  const _$ParamValue_NullImpl() : super._();

  @override
  String toString() {
    return 'ParamValue.null_()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ParamValue_NullImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int field0) integer,
    required TResult Function(double field0) real,
    required TResult Function(String field0) text,
    required TResult Function(Uint8List field0) blob,
    required TResult Function() null_,
  }) {
    return null_();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int field0)? integer,
    TResult? Function(double field0)? real,
    TResult? Function(String field0)? text,
    TResult? Function(Uint8List field0)? blob,
    TResult? Function()? null_,
  }) {
    return null_?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int field0)? integer,
    TResult Function(double field0)? real,
    TResult Function(String field0)? text,
    TResult Function(Uint8List field0)? blob,
    TResult Function()? null_,
    required TResult orElse(),
  }) {
    if (null_ != null) {
      return null_();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParamValue_Integer value) integer,
    required TResult Function(ParamValue_Real value) real,
    required TResult Function(ParamValue_Text value) text,
    required TResult Function(ParamValue_Blob value) blob,
    required TResult Function(ParamValue_Null value) null_,
  }) {
    return null_(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParamValue_Integer value)? integer,
    TResult? Function(ParamValue_Real value)? real,
    TResult? Function(ParamValue_Text value)? text,
    TResult? Function(ParamValue_Blob value)? blob,
    TResult? Function(ParamValue_Null value)? null_,
  }) {
    return null_?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParamValue_Integer value)? integer,
    TResult Function(ParamValue_Real value)? real,
    TResult Function(ParamValue_Text value)? text,
    TResult Function(ParamValue_Blob value)? blob,
    TResult Function(ParamValue_Null value)? null_,
    required TResult orElse(),
  }) {
    if (null_ != null) {
      return null_(this);
    }
    return orElse();
  }
}

abstract class ParamValue_Null extends ParamValue {
  const factory ParamValue_Null() = _$ParamValue_NullImpl;
  const ParamValue_Null._() : super._();
}
