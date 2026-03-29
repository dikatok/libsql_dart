// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LibsqlReturnValue {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LibsqlReturnValue);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LibsqlReturnValue()';
  }
}

/// @nodoc
class $LibsqlReturnValueCopyWith<$Res> {
  $LibsqlReturnValueCopyWith(
      LibsqlReturnValue _, $Res Function(LibsqlReturnValue) __);
}

/// Adds pattern-matching-related methods to [LibsqlReturnValue].
extension LibsqlReturnValuePatterns on LibsqlReturnValue {
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
    TResult Function(LibsqlReturnValue_Integer value)? integer,
    TResult Function(LibsqlReturnValue_Real value)? real,
    TResult Function(LibsqlReturnValue_Text value)? text,
    TResult Function(LibsqlReturnValue_Blob value)? blob,
    TResult Function(LibsqlReturnValue_Null value)? null_,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LibsqlReturnValue_Integer() when integer != null:
        return integer(_that);
      case LibsqlReturnValue_Real() when real != null:
        return real(_that);
      case LibsqlReturnValue_Text() when text != null:
        return text(_that);
      case LibsqlReturnValue_Blob() when blob != null:
        return blob(_that);
      case LibsqlReturnValue_Null() when null_ != null:
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
    required TResult Function(LibsqlReturnValue_Integer value) integer,
    required TResult Function(LibsqlReturnValue_Real value) real,
    required TResult Function(LibsqlReturnValue_Text value) text,
    required TResult Function(LibsqlReturnValue_Blob value) blob,
    required TResult Function(LibsqlReturnValue_Null value) null_,
  }) {
    final _that = this;
    switch (_that) {
      case LibsqlReturnValue_Integer():
        return integer(_that);
      case LibsqlReturnValue_Real():
        return real(_that);
      case LibsqlReturnValue_Text():
        return text(_that);
      case LibsqlReturnValue_Blob():
        return blob(_that);
      case LibsqlReturnValue_Null():
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
    TResult? Function(LibsqlReturnValue_Integer value)? integer,
    TResult? Function(LibsqlReturnValue_Real value)? real,
    TResult? Function(LibsqlReturnValue_Text value)? text,
    TResult? Function(LibsqlReturnValue_Blob value)? blob,
    TResult? Function(LibsqlReturnValue_Null value)? null_,
  }) {
    final _that = this;
    switch (_that) {
      case LibsqlReturnValue_Integer() when integer != null:
        return integer(_that);
      case LibsqlReturnValue_Real() when real != null:
        return real(_that);
      case LibsqlReturnValue_Text() when text != null:
        return text(_that);
      case LibsqlReturnValue_Blob() when blob != null:
        return blob(_that);
      case LibsqlReturnValue_Null() when null_ != null:
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
      case LibsqlReturnValue_Integer() when integer != null:
        return integer(_that.field0);
      case LibsqlReturnValue_Real() when real != null:
        return real(_that.field0);
      case LibsqlReturnValue_Text() when text != null:
        return text(_that.field0);
      case LibsqlReturnValue_Blob() when blob != null:
        return blob(_that.field0);
      case LibsqlReturnValue_Null() when null_ != null:
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
      case LibsqlReturnValue_Integer():
        return integer(_that.field0);
      case LibsqlReturnValue_Real():
        return real(_that.field0);
      case LibsqlReturnValue_Text():
        return text(_that.field0);
      case LibsqlReturnValue_Blob():
        return blob(_that.field0);
      case LibsqlReturnValue_Null():
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
      case LibsqlReturnValue_Integer() when integer != null:
        return integer(_that.field0);
      case LibsqlReturnValue_Real() when real != null:
        return real(_that.field0);
      case LibsqlReturnValue_Text() when text != null:
        return text(_that.field0);
      case LibsqlReturnValue_Blob() when blob != null:
        return blob(_that.field0);
      case LibsqlReturnValue_Null() when null_ != null:
        return null_();
      case _:
        return null;
    }
  }
}

/// @nodoc

class LibsqlReturnValue_Integer extends LibsqlReturnValue {
  const LibsqlReturnValue_Integer(this.field0) : super._();

  final PlatformInt64 field0;

  /// Create a copy of LibsqlReturnValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LibsqlReturnValue_IntegerCopyWith<LibsqlReturnValue_Integer> get copyWith =>
      _$LibsqlReturnValue_IntegerCopyWithImpl<LibsqlReturnValue_Integer>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LibsqlReturnValue_Integer &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'LibsqlReturnValue.integer(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $LibsqlReturnValue_IntegerCopyWith<$Res>
    implements $LibsqlReturnValueCopyWith<$Res> {
  factory $LibsqlReturnValue_IntegerCopyWith(LibsqlReturnValue_Integer value,
          $Res Function(LibsqlReturnValue_Integer) _then) =
      _$LibsqlReturnValue_IntegerCopyWithImpl;
  @useResult
  $Res call({PlatformInt64 field0});
}

/// @nodoc
class _$LibsqlReturnValue_IntegerCopyWithImpl<$Res>
    implements $LibsqlReturnValue_IntegerCopyWith<$Res> {
  _$LibsqlReturnValue_IntegerCopyWithImpl(this._self, this._then);

  final LibsqlReturnValue_Integer _self;
  final $Res Function(LibsqlReturnValue_Integer) _then;

  /// Create a copy of LibsqlReturnValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(LibsqlReturnValue_Integer(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as PlatformInt64,
    ));
  }
}

/// @nodoc

class LibsqlReturnValue_Real extends LibsqlReturnValue {
  const LibsqlReturnValue_Real(this.field0) : super._();

  final double field0;

  /// Create a copy of LibsqlReturnValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LibsqlReturnValue_RealCopyWith<LibsqlReturnValue_Real> get copyWith =>
      _$LibsqlReturnValue_RealCopyWithImpl<LibsqlReturnValue_Real>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LibsqlReturnValue_Real &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'LibsqlReturnValue.real(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $LibsqlReturnValue_RealCopyWith<$Res>
    implements $LibsqlReturnValueCopyWith<$Res> {
  factory $LibsqlReturnValue_RealCopyWith(LibsqlReturnValue_Real value,
          $Res Function(LibsqlReturnValue_Real) _then) =
      _$LibsqlReturnValue_RealCopyWithImpl;
  @useResult
  $Res call({double field0});
}

/// @nodoc
class _$LibsqlReturnValue_RealCopyWithImpl<$Res>
    implements $LibsqlReturnValue_RealCopyWith<$Res> {
  _$LibsqlReturnValue_RealCopyWithImpl(this._self, this._then);

  final LibsqlReturnValue_Real _self;
  final $Res Function(LibsqlReturnValue_Real) _then;

  /// Create a copy of LibsqlReturnValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(LibsqlReturnValue_Real(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class LibsqlReturnValue_Text extends LibsqlReturnValue {
  const LibsqlReturnValue_Text(this.field0) : super._();

  final String field0;

  /// Create a copy of LibsqlReturnValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LibsqlReturnValue_TextCopyWith<LibsqlReturnValue_Text> get copyWith =>
      _$LibsqlReturnValue_TextCopyWithImpl<LibsqlReturnValue_Text>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LibsqlReturnValue_Text &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'LibsqlReturnValue.text(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $LibsqlReturnValue_TextCopyWith<$Res>
    implements $LibsqlReturnValueCopyWith<$Res> {
  factory $LibsqlReturnValue_TextCopyWith(LibsqlReturnValue_Text value,
          $Res Function(LibsqlReturnValue_Text) _then) =
      _$LibsqlReturnValue_TextCopyWithImpl;
  @useResult
  $Res call({String field0});
}

/// @nodoc
class _$LibsqlReturnValue_TextCopyWithImpl<$Res>
    implements $LibsqlReturnValue_TextCopyWith<$Res> {
  _$LibsqlReturnValue_TextCopyWithImpl(this._self, this._then);

  final LibsqlReturnValue_Text _self;
  final $Res Function(LibsqlReturnValue_Text) _then;

  /// Create a copy of LibsqlReturnValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(LibsqlReturnValue_Text(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class LibsqlReturnValue_Blob extends LibsqlReturnValue {
  const LibsqlReturnValue_Blob(this.field0) : super._();

  final Uint8List field0;

  /// Create a copy of LibsqlReturnValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LibsqlReturnValue_BlobCopyWith<LibsqlReturnValue_Blob> get copyWith =>
      _$LibsqlReturnValue_BlobCopyWithImpl<LibsqlReturnValue_Blob>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LibsqlReturnValue_Blob &&
            const DeepCollectionEquality().equals(other.field0, field0));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(field0));

  @override
  String toString() {
    return 'LibsqlReturnValue.blob(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $LibsqlReturnValue_BlobCopyWith<$Res>
    implements $LibsqlReturnValueCopyWith<$Res> {
  factory $LibsqlReturnValue_BlobCopyWith(LibsqlReturnValue_Blob value,
          $Res Function(LibsqlReturnValue_Blob) _then) =
      _$LibsqlReturnValue_BlobCopyWithImpl;
  @useResult
  $Res call({Uint8List field0});
}

/// @nodoc
class _$LibsqlReturnValue_BlobCopyWithImpl<$Res>
    implements $LibsqlReturnValue_BlobCopyWith<$Res> {
  _$LibsqlReturnValue_BlobCopyWithImpl(this._self, this._then);

  final LibsqlReturnValue_Blob _self;
  final $Res Function(LibsqlReturnValue_Blob) _then;

  /// Create a copy of LibsqlReturnValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(LibsqlReturnValue_Blob(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc

class LibsqlReturnValue_Null extends LibsqlReturnValue {
  const LibsqlReturnValue_Null() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LibsqlReturnValue_Null);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LibsqlReturnValue.null_()';
  }
}

// dart format on
