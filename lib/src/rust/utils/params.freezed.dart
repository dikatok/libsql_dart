// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LibsqlValue {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LibsqlValue);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LibsqlValue()';
  }
}

/// @nodoc
class $LibsqlValueCopyWith<$Res> {
  $LibsqlValueCopyWith(LibsqlValue _, $Res Function(LibsqlValue) __);
}

/// Adds pattern-matching-related methods to [LibsqlValue].
extension LibsqlValuePatterns on LibsqlValue {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LibsqlValue_Integer value)? integer,
    TResult Function(LibsqlValue_Real value)? real,
    TResult Function(LibsqlValue_Text value)? text,
    TResult Function(LibsqlValue_Blob value)? blob,
    TResult Function(LibsqlValue_Null value)? null_,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LibsqlValue_Integer() when integer != null:
        return integer(_that);
      case LibsqlValue_Real() when real != null:
        return real(_that);
      case LibsqlValue_Text() when text != null:
        return text(_that);
      case LibsqlValue_Blob() when blob != null:
        return blob(_that);
      case LibsqlValue_Null() when null_ != null:
        return null_(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LibsqlValue_Integer value) integer,
    required TResult Function(LibsqlValue_Real value) real,
    required TResult Function(LibsqlValue_Text value) text,
    required TResult Function(LibsqlValue_Blob value) blob,
    required TResult Function(LibsqlValue_Null value) null_,
  }) {
    final _that = this;
    switch (_that) {
      case LibsqlValue_Integer():
        return integer(_that);
      case LibsqlValue_Real():
        return real(_that);
      case LibsqlValue_Text():
        return text(_that);
      case LibsqlValue_Blob():
        return blob(_that);
      case LibsqlValue_Null():
        return null_(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LibsqlValue_Integer value)? integer,
    TResult? Function(LibsqlValue_Real value)? real,
    TResult? Function(LibsqlValue_Text value)? text,
    TResult? Function(LibsqlValue_Blob value)? blob,
    TResult? Function(LibsqlValue_Null value)? null_,
  }) {
    final _that = this;
    switch (_that) {
      case LibsqlValue_Integer() when integer != null:
        return integer(_that);
      case LibsqlValue_Real() when real != null:
        return real(_that);
      case LibsqlValue_Text() when text != null:
        return text(_that);
      case LibsqlValue_Blob() when blob != null:
        return blob(_that);
      case LibsqlValue_Null() when null_ != null:
        return null_(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PlatformInt64 field0)? integer,
    TResult Function(double field0)? real,
    TResult Function(String field0)? text,
    TResult Function(Uint8List field0)? blob,
    TResult Function()? null_,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LibsqlValue_Integer() when integer != null:
        return integer(_that.field0);
      case LibsqlValue_Real() when real != null:
        return real(_that.field0);
      case LibsqlValue_Text() when text != null:
        return text(_that.field0);
      case LibsqlValue_Blob() when blob != null:
        return blob(_that.field0);
      case LibsqlValue_Null() when null_ != null:
        return null_();
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PlatformInt64 field0) integer,
    required TResult Function(double field0) real,
    required TResult Function(String field0) text,
    required TResult Function(Uint8List field0) blob,
    required TResult Function() null_,
  }) {
    final _that = this;
    switch (_that) {
      case LibsqlValue_Integer():
        return integer(_that.field0);
      case LibsqlValue_Real():
        return real(_that.field0);
      case LibsqlValue_Text():
        return text(_that.field0);
      case LibsqlValue_Blob():
        return blob(_that.field0);
      case LibsqlValue_Null():
        return null_();
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PlatformInt64 field0)? integer,
    TResult? Function(double field0)? real,
    TResult? Function(String field0)? text,
    TResult? Function(Uint8List field0)? blob,
    TResult? Function()? null_,
  }) {
    final _that = this;
    switch (_that) {
      case LibsqlValue_Integer() when integer != null:
        return integer(_that.field0);
      case LibsqlValue_Real() when real != null:
        return real(_that.field0);
      case LibsqlValue_Text() when text != null:
        return text(_that.field0);
      case LibsqlValue_Blob() when blob != null:
        return blob(_that.field0);
      case LibsqlValue_Null() when null_ != null:
        return null_();
      case _:
        return null;
    }
  }
}

/// @nodoc

class LibsqlValue_Integer extends LibsqlValue {
  const LibsqlValue_Integer(this.field0) : super._();

  final PlatformInt64 field0;

  /// Create a copy of LibsqlValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LibsqlValue_IntegerCopyWith<LibsqlValue_Integer> get copyWith =>
      _$LibsqlValue_IntegerCopyWithImpl<LibsqlValue_Integer>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LibsqlValue_Integer &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'LibsqlValue.integer(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $LibsqlValue_IntegerCopyWith<$Res>
    implements $LibsqlValueCopyWith<$Res> {
  factory $LibsqlValue_IntegerCopyWith(
          LibsqlValue_Integer value, $Res Function(LibsqlValue_Integer) _then) =
      _$LibsqlValue_IntegerCopyWithImpl;
  @useResult
  $Res call({PlatformInt64 field0});
}

/// @nodoc
class _$LibsqlValue_IntegerCopyWithImpl<$Res>
    implements $LibsqlValue_IntegerCopyWith<$Res> {
  _$LibsqlValue_IntegerCopyWithImpl(this._self, this._then);

  final LibsqlValue_Integer _self;
  final $Res Function(LibsqlValue_Integer) _then;

  /// Create a copy of LibsqlValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(LibsqlValue_Integer(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as PlatformInt64,
    ));
  }
}

/// @nodoc

class LibsqlValue_Real extends LibsqlValue {
  const LibsqlValue_Real(this.field0) : super._();

  final double field0;

  /// Create a copy of LibsqlValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LibsqlValue_RealCopyWith<LibsqlValue_Real> get copyWith =>
      _$LibsqlValue_RealCopyWithImpl<LibsqlValue_Real>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LibsqlValue_Real &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'LibsqlValue.real(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $LibsqlValue_RealCopyWith<$Res>
    implements $LibsqlValueCopyWith<$Res> {
  factory $LibsqlValue_RealCopyWith(
          LibsqlValue_Real value, $Res Function(LibsqlValue_Real) _then) =
      _$LibsqlValue_RealCopyWithImpl;
  @useResult
  $Res call({double field0});
}

/// @nodoc
class _$LibsqlValue_RealCopyWithImpl<$Res>
    implements $LibsqlValue_RealCopyWith<$Res> {
  _$LibsqlValue_RealCopyWithImpl(this._self, this._then);

  final LibsqlValue_Real _self;
  final $Res Function(LibsqlValue_Real) _then;

  /// Create a copy of LibsqlValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(LibsqlValue_Real(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class LibsqlValue_Text extends LibsqlValue {
  const LibsqlValue_Text(this.field0) : super._();

  final String field0;

  /// Create a copy of LibsqlValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LibsqlValue_TextCopyWith<LibsqlValue_Text> get copyWith =>
      _$LibsqlValue_TextCopyWithImpl<LibsqlValue_Text>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LibsqlValue_Text &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'LibsqlValue.text(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $LibsqlValue_TextCopyWith<$Res>
    implements $LibsqlValueCopyWith<$Res> {
  factory $LibsqlValue_TextCopyWith(
          LibsqlValue_Text value, $Res Function(LibsqlValue_Text) _then) =
      _$LibsqlValue_TextCopyWithImpl;
  @useResult
  $Res call({String field0});
}

/// @nodoc
class _$LibsqlValue_TextCopyWithImpl<$Res>
    implements $LibsqlValue_TextCopyWith<$Res> {
  _$LibsqlValue_TextCopyWithImpl(this._self, this._then);

  final LibsqlValue_Text _self;
  final $Res Function(LibsqlValue_Text) _then;

  /// Create a copy of LibsqlValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(LibsqlValue_Text(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class LibsqlValue_Blob extends LibsqlValue {
  const LibsqlValue_Blob(this.field0) : super._();

  final Uint8List field0;

  /// Create a copy of LibsqlValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LibsqlValue_BlobCopyWith<LibsqlValue_Blob> get copyWith =>
      _$LibsqlValue_BlobCopyWithImpl<LibsqlValue_Blob>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LibsqlValue_Blob &&
            const DeepCollectionEquality().equals(other.field0, field0));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(field0));

  @override
  String toString() {
    return 'LibsqlValue.blob(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $LibsqlValue_BlobCopyWith<$Res>
    implements $LibsqlValueCopyWith<$Res> {
  factory $LibsqlValue_BlobCopyWith(
          LibsqlValue_Blob value, $Res Function(LibsqlValue_Blob) _then) =
      _$LibsqlValue_BlobCopyWithImpl;
  @useResult
  $Res call({Uint8List field0});
}

/// @nodoc
class _$LibsqlValue_BlobCopyWithImpl<$Res>
    implements $LibsqlValue_BlobCopyWith<$Res> {
  _$LibsqlValue_BlobCopyWithImpl(this._self, this._then);

  final LibsqlValue_Blob _self;
  final $Res Function(LibsqlValue_Blob) _then;

  /// Create a copy of LibsqlValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(LibsqlValue_Blob(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc

class LibsqlValue_Null extends LibsqlValue {
  const LibsqlValue_Null() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LibsqlValue_Null);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LibsqlValue.null_()';
  }
}

// dart format on
