// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unexpected_error_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UnexpectedErrorDto {

 String get message; int? get statusCode; Map<String, dynamic>? get details;
/// Create a copy of UnexpectedErrorDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnexpectedErrorDtoCopyWith<UnexpectedErrorDto> get copyWith => _$UnexpectedErrorDtoCopyWithImpl<UnexpectedErrorDto>(this as UnexpectedErrorDto, _$identity);

  /// Serializes this UnexpectedErrorDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnexpectedErrorDto&&(identical(other.message, message) || other.message == message)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&const DeepCollectionEquality().equals(other.details, details));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,statusCode,const DeepCollectionEquality().hash(details));

@override
String toString() {
  return 'UnexpectedErrorDto(message: $message, statusCode: $statusCode, details: $details)';
}


}

/// @nodoc
abstract mixin class $UnexpectedErrorDtoCopyWith<$Res>  {
  factory $UnexpectedErrorDtoCopyWith(UnexpectedErrorDto value, $Res Function(UnexpectedErrorDto) _then) = _$UnexpectedErrorDtoCopyWithImpl;
@useResult
$Res call({
 String message, int? statusCode, Map<String, dynamic>? details
});




}
/// @nodoc
class _$UnexpectedErrorDtoCopyWithImpl<$Res>
    implements $UnexpectedErrorDtoCopyWith<$Res> {
  _$UnexpectedErrorDtoCopyWithImpl(this._self, this._then);

  final UnexpectedErrorDto _self;
  final $Res Function(UnexpectedErrorDto) _then;

/// Create a copy of UnexpectedErrorDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? statusCode = freezed,Object? details = freezed,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [UnexpectedErrorDto].
extension UnexpectedErrorDtoPatterns on UnexpectedErrorDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UnexpectedErrorDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UnexpectedErrorDto() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UnexpectedErrorDto value)  $default,){
final _that = this;
switch (_that) {
case _UnexpectedErrorDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UnexpectedErrorDto value)?  $default,){
final _that = this;
switch (_that) {
case _UnexpectedErrorDto() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message,  int? statusCode,  Map<String, dynamic>? details)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UnexpectedErrorDto() when $default != null:
return $default(_that.message,_that.statusCode,_that.details);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message,  int? statusCode,  Map<String, dynamic>? details)  $default,) {final _that = this;
switch (_that) {
case _UnexpectedErrorDto():
return $default(_that.message,_that.statusCode,_that.details);case _:
  throw StateError('Unexpected subclass');

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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message,  int? statusCode,  Map<String, dynamic>? details)?  $default,) {final _that = this;
switch (_that) {
case _UnexpectedErrorDto() when $default != null:
return $default(_that.message,_that.statusCode,_that.details);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UnexpectedErrorDto implements UnexpectedErrorDto {
  const _UnexpectedErrorDto({required this.message, this.statusCode, final  Map<String, dynamic>? details}): _details = details;
  factory _UnexpectedErrorDto.fromJson(Map<String, dynamic> json) => _$UnexpectedErrorDtoFromJson(json);

@override final  String message;
@override final  int? statusCode;
 final  Map<String, dynamic>? _details;
@override Map<String, dynamic>? get details {
  final value = _details;
  if (value == null) return null;
  if (_details is EqualUnmodifiableMapView) return _details;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of UnexpectedErrorDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnexpectedErrorDtoCopyWith<_UnexpectedErrorDto> get copyWith => __$UnexpectedErrorDtoCopyWithImpl<_UnexpectedErrorDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UnexpectedErrorDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnexpectedErrorDto&&(identical(other.message, message) || other.message == message)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&const DeepCollectionEquality().equals(other._details, _details));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,statusCode,const DeepCollectionEquality().hash(_details));

@override
String toString() {
  return 'UnexpectedErrorDto(message: $message, statusCode: $statusCode, details: $details)';
}


}

/// @nodoc
abstract mixin class _$UnexpectedErrorDtoCopyWith<$Res> implements $UnexpectedErrorDtoCopyWith<$Res> {
  factory _$UnexpectedErrorDtoCopyWith(_UnexpectedErrorDto value, $Res Function(_UnexpectedErrorDto) _then) = __$UnexpectedErrorDtoCopyWithImpl;
@override @useResult
$Res call({
 String message, int? statusCode, Map<String, dynamic>? details
});




}
/// @nodoc
class __$UnexpectedErrorDtoCopyWithImpl<$Res>
    implements _$UnexpectedErrorDtoCopyWith<$Res> {
  __$UnexpectedErrorDtoCopyWithImpl(this._self, this._then);

  final _UnexpectedErrorDto _self;
  final $Res Function(_UnexpectedErrorDto) _then;

/// Create a copy of UnexpectedErrorDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? statusCode = freezed,Object? details = freezed,}) {
  return _then(_UnexpectedErrorDto(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,details: freezed == details ? _self._details : details // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
