// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LibsqlValue {
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
    required TResult Function(LibsqlValue_Integer value) integer,
    required TResult Function(LibsqlValue_Real value) real,
    required TResult Function(LibsqlValue_Text value) text,
    required TResult Function(LibsqlValue_Blob value) blob,
    required TResult Function(LibsqlValue_Null value) null_,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LibsqlValue_Integer value)? integer,
    TResult? Function(LibsqlValue_Real value)? real,
    TResult? Function(LibsqlValue_Text value)? text,
    TResult? Function(LibsqlValue_Blob value)? blob,
    TResult? Function(LibsqlValue_Null value)? null_,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LibsqlValue_Integer value)? integer,
    TResult Function(LibsqlValue_Real value)? real,
    TResult Function(LibsqlValue_Text value)? text,
    TResult Function(LibsqlValue_Blob value)? blob,
    TResult Function(LibsqlValue_Null value)? null_,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibsqlValueCopyWith<$Res> {
  factory $LibsqlValueCopyWith(
          LibsqlValue value, $Res Function(LibsqlValue) then) =
      _$LibsqlValueCopyWithImpl<$Res, LibsqlValue>;
}

/// @nodoc
class _$LibsqlValueCopyWithImpl<$Res, $Val extends LibsqlValue>
    implements $LibsqlValueCopyWith<$Res> {
  _$LibsqlValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LibsqlValue
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LibsqlValue_IntegerImplCopyWith<$Res> {
  factory _$$LibsqlValue_IntegerImplCopyWith(_$LibsqlValue_IntegerImpl value,
          $Res Function(_$LibsqlValue_IntegerImpl) then) =
      __$$LibsqlValue_IntegerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int field0});
}

/// @nodoc
class __$$LibsqlValue_IntegerImplCopyWithImpl<$Res>
    extends _$LibsqlValueCopyWithImpl<$Res, _$LibsqlValue_IntegerImpl>
    implements _$$LibsqlValue_IntegerImplCopyWith<$Res> {
  __$$LibsqlValue_IntegerImplCopyWithImpl(_$LibsqlValue_IntegerImpl _value,
      $Res Function(_$LibsqlValue_IntegerImpl) _then)
      : super(_value, _then);

  /// Create a copy of LibsqlValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$LibsqlValue_IntegerImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LibsqlValue_IntegerImpl extends LibsqlValue_Integer {
  const _$LibsqlValue_IntegerImpl(this.field0) : super._();

  @override
  final int field0;

  @override
  String toString() {
    return 'LibsqlValue.integer(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LibsqlValue_IntegerImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  /// Create a copy of LibsqlValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LibsqlValue_IntegerImplCopyWith<_$LibsqlValue_IntegerImpl> get copyWith =>
      __$$LibsqlValue_IntegerImplCopyWithImpl<_$LibsqlValue_IntegerImpl>(
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
    required TResult Function(LibsqlValue_Integer value) integer,
    required TResult Function(LibsqlValue_Real value) real,
    required TResult Function(LibsqlValue_Text value) text,
    required TResult Function(LibsqlValue_Blob value) blob,
    required TResult Function(LibsqlValue_Null value) null_,
  }) {
    return integer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LibsqlValue_Integer value)? integer,
    TResult? Function(LibsqlValue_Real value)? real,
    TResult? Function(LibsqlValue_Text value)? text,
    TResult? Function(LibsqlValue_Blob value)? blob,
    TResult? Function(LibsqlValue_Null value)? null_,
  }) {
    return integer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LibsqlValue_Integer value)? integer,
    TResult Function(LibsqlValue_Real value)? real,
    TResult Function(LibsqlValue_Text value)? text,
    TResult Function(LibsqlValue_Blob value)? blob,
    TResult Function(LibsqlValue_Null value)? null_,
    required TResult orElse(),
  }) {
    if (integer != null) {
      return integer(this);
    }
    return orElse();
  }
}

abstract class LibsqlValue_Integer extends LibsqlValue {
  const factory LibsqlValue_Integer(final int field0) =
      _$LibsqlValue_IntegerImpl;
  const LibsqlValue_Integer._() : super._();

  int get field0;

  /// Create a copy of LibsqlValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LibsqlValue_IntegerImplCopyWith<_$LibsqlValue_IntegerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LibsqlValue_RealImplCopyWith<$Res> {
  factory _$$LibsqlValue_RealImplCopyWith(_$LibsqlValue_RealImpl value,
          $Res Function(_$LibsqlValue_RealImpl) then) =
      __$$LibsqlValue_RealImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double field0});
}

/// @nodoc
class __$$LibsqlValue_RealImplCopyWithImpl<$Res>
    extends _$LibsqlValueCopyWithImpl<$Res, _$LibsqlValue_RealImpl>
    implements _$$LibsqlValue_RealImplCopyWith<$Res> {
  __$$LibsqlValue_RealImplCopyWithImpl(_$LibsqlValue_RealImpl _value,
      $Res Function(_$LibsqlValue_RealImpl) _then)
      : super(_value, _then);

  /// Create a copy of LibsqlValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$LibsqlValue_RealImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$LibsqlValue_RealImpl extends LibsqlValue_Real {
  const _$LibsqlValue_RealImpl(this.field0) : super._();

  @override
  final double field0;

  @override
  String toString() {
    return 'LibsqlValue.real(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LibsqlValue_RealImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  /// Create a copy of LibsqlValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LibsqlValue_RealImplCopyWith<_$LibsqlValue_RealImpl> get copyWith =>
      __$$LibsqlValue_RealImplCopyWithImpl<_$LibsqlValue_RealImpl>(
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
    required TResult Function(LibsqlValue_Integer value) integer,
    required TResult Function(LibsqlValue_Real value) real,
    required TResult Function(LibsqlValue_Text value) text,
    required TResult Function(LibsqlValue_Blob value) blob,
    required TResult Function(LibsqlValue_Null value) null_,
  }) {
    return real(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LibsqlValue_Integer value)? integer,
    TResult? Function(LibsqlValue_Real value)? real,
    TResult? Function(LibsqlValue_Text value)? text,
    TResult? Function(LibsqlValue_Blob value)? blob,
    TResult? Function(LibsqlValue_Null value)? null_,
  }) {
    return real?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LibsqlValue_Integer value)? integer,
    TResult Function(LibsqlValue_Real value)? real,
    TResult Function(LibsqlValue_Text value)? text,
    TResult Function(LibsqlValue_Blob value)? blob,
    TResult Function(LibsqlValue_Null value)? null_,
    required TResult orElse(),
  }) {
    if (real != null) {
      return real(this);
    }
    return orElse();
  }
}

abstract class LibsqlValue_Real extends LibsqlValue {
  const factory LibsqlValue_Real(final double field0) = _$LibsqlValue_RealImpl;
  const LibsqlValue_Real._() : super._();

  double get field0;

  /// Create a copy of LibsqlValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LibsqlValue_RealImplCopyWith<_$LibsqlValue_RealImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LibsqlValue_TextImplCopyWith<$Res> {
  factory _$$LibsqlValue_TextImplCopyWith(_$LibsqlValue_TextImpl value,
          $Res Function(_$LibsqlValue_TextImpl) then) =
      __$$LibsqlValue_TextImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String field0});
}

/// @nodoc
class __$$LibsqlValue_TextImplCopyWithImpl<$Res>
    extends _$LibsqlValueCopyWithImpl<$Res, _$LibsqlValue_TextImpl>
    implements _$$LibsqlValue_TextImplCopyWith<$Res> {
  __$$LibsqlValue_TextImplCopyWithImpl(_$LibsqlValue_TextImpl _value,
      $Res Function(_$LibsqlValue_TextImpl) _then)
      : super(_value, _then);

  /// Create a copy of LibsqlValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$LibsqlValue_TextImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LibsqlValue_TextImpl extends LibsqlValue_Text {
  const _$LibsqlValue_TextImpl(this.field0) : super._();

  @override
  final String field0;

  @override
  String toString() {
    return 'LibsqlValue.text(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LibsqlValue_TextImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  /// Create a copy of LibsqlValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LibsqlValue_TextImplCopyWith<_$LibsqlValue_TextImpl> get copyWith =>
      __$$LibsqlValue_TextImplCopyWithImpl<_$LibsqlValue_TextImpl>(
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
    required TResult Function(LibsqlValue_Integer value) integer,
    required TResult Function(LibsqlValue_Real value) real,
    required TResult Function(LibsqlValue_Text value) text,
    required TResult Function(LibsqlValue_Blob value) blob,
    required TResult Function(LibsqlValue_Null value) null_,
  }) {
    return text(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LibsqlValue_Integer value)? integer,
    TResult? Function(LibsqlValue_Real value)? real,
    TResult? Function(LibsqlValue_Text value)? text,
    TResult? Function(LibsqlValue_Blob value)? blob,
    TResult? Function(LibsqlValue_Null value)? null_,
  }) {
    return text?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LibsqlValue_Integer value)? integer,
    TResult Function(LibsqlValue_Real value)? real,
    TResult Function(LibsqlValue_Text value)? text,
    TResult Function(LibsqlValue_Blob value)? blob,
    TResult Function(LibsqlValue_Null value)? null_,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this);
    }
    return orElse();
  }
}

abstract class LibsqlValue_Text extends LibsqlValue {
  const factory LibsqlValue_Text(final String field0) = _$LibsqlValue_TextImpl;
  const LibsqlValue_Text._() : super._();

  String get field0;

  /// Create a copy of LibsqlValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LibsqlValue_TextImplCopyWith<_$LibsqlValue_TextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LibsqlValue_BlobImplCopyWith<$Res> {
  factory _$$LibsqlValue_BlobImplCopyWith(_$LibsqlValue_BlobImpl value,
          $Res Function(_$LibsqlValue_BlobImpl) then) =
      __$$LibsqlValue_BlobImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Uint8List field0});
}

/// @nodoc
class __$$LibsqlValue_BlobImplCopyWithImpl<$Res>
    extends _$LibsqlValueCopyWithImpl<$Res, _$LibsqlValue_BlobImpl>
    implements _$$LibsqlValue_BlobImplCopyWith<$Res> {
  __$$LibsqlValue_BlobImplCopyWithImpl(_$LibsqlValue_BlobImpl _value,
      $Res Function(_$LibsqlValue_BlobImpl) _then)
      : super(_value, _then);

  /// Create a copy of LibsqlValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$LibsqlValue_BlobImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc

class _$LibsqlValue_BlobImpl extends LibsqlValue_Blob {
  const _$LibsqlValue_BlobImpl(this.field0) : super._();

  @override
  final Uint8List field0;

  @override
  String toString() {
    return 'LibsqlValue.blob(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LibsqlValue_BlobImpl &&
            const DeepCollectionEquality().equals(other.field0, field0));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(field0));

  /// Create a copy of LibsqlValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LibsqlValue_BlobImplCopyWith<_$LibsqlValue_BlobImpl> get copyWith =>
      __$$LibsqlValue_BlobImplCopyWithImpl<_$LibsqlValue_BlobImpl>(
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
    required TResult Function(LibsqlValue_Integer value) integer,
    required TResult Function(LibsqlValue_Real value) real,
    required TResult Function(LibsqlValue_Text value) text,
    required TResult Function(LibsqlValue_Blob value) blob,
    required TResult Function(LibsqlValue_Null value) null_,
  }) {
    return blob(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LibsqlValue_Integer value)? integer,
    TResult? Function(LibsqlValue_Real value)? real,
    TResult? Function(LibsqlValue_Text value)? text,
    TResult? Function(LibsqlValue_Blob value)? blob,
    TResult? Function(LibsqlValue_Null value)? null_,
  }) {
    return blob?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LibsqlValue_Integer value)? integer,
    TResult Function(LibsqlValue_Real value)? real,
    TResult Function(LibsqlValue_Text value)? text,
    TResult Function(LibsqlValue_Blob value)? blob,
    TResult Function(LibsqlValue_Null value)? null_,
    required TResult orElse(),
  }) {
    if (blob != null) {
      return blob(this);
    }
    return orElse();
  }
}

abstract class LibsqlValue_Blob extends LibsqlValue {
  const factory LibsqlValue_Blob(final Uint8List field0) =
      _$LibsqlValue_BlobImpl;
  const LibsqlValue_Blob._() : super._();

  Uint8List get field0;

  /// Create a copy of LibsqlValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LibsqlValue_BlobImplCopyWith<_$LibsqlValue_BlobImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LibsqlValue_NullImplCopyWith<$Res> {
  factory _$$LibsqlValue_NullImplCopyWith(_$LibsqlValue_NullImpl value,
          $Res Function(_$LibsqlValue_NullImpl) then) =
      __$$LibsqlValue_NullImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LibsqlValue_NullImplCopyWithImpl<$Res>
    extends _$LibsqlValueCopyWithImpl<$Res, _$LibsqlValue_NullImpl>
    implements _$$LibsqlValue_NullImplCopyWith<$Res> {
  __$$LibsqlValue_NullImplCopyWithImpl(_$LibsqlValue_NullImpl _value,
      $Res Function(_$LibsqlValue_NullImpl) _then)
      : super(_value, _then);

  /// Create a copy of LibsqlValue
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LibsqlValue_NullImpl extends LibsqlValue_Null {
  const _$LibsqlValue_NullImpl() : super._();

  @override
  String toString() {
    return 'LibsqlValue.null_()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LibsqlValue_NullImpl);
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
    required TResult Function(LibsqlValue_Integer value) integer,
    required TResult Function(LibsqlValue_Real value) real,
    required TResult Function(LibsqlValue_Text value) text,
    required TResult Function(LibsqlValue_Blob value) blob,
    required TResult Function(LibsqlValue_Null value) null_,
  }) {
    return null_(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LibsqlValue_Integer value)? integer,
    TResult? Function(LibsqlValue_Real value)? real,
    TResult? Function(LibsqlValue_Text value)? text,
    TResult? Function(LibsqlValue_Blob value)? blob,
    TResult? Function(LibsqlValue_Null value)? null_,
  }) {
    return null_?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LibsqlValue_Integer value)? integer,
    TResult Function(LibsqlValue_Real value)? real,
    TResult Function(LibsqlValue_Text value)? text,
    TResult Function(LibsqlValue_Blob value)? blob,
    TResult Function(LibsqlValue_Null value)? null_,
    required TResult orElse(),
  }) {
    if (null_ != null) {
      return null_(this);
    }
    return orElse();
  }
}

abstract class LibsqlValue_Null extends LibsqlValue {
  const factory LibsqlValue_Null() = _$LibsqlValue_NullImpl;
  const LibsqlValue_Null._() : super._();
}
