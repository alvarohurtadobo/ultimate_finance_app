// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'un_processable_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UnProcessableRequestDto {

 String get message; Map<String, List<String>> get fieldErrors;
/// Create a copy of UnProcessableRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnProcessableRequestDtoCopyWith<UnProcessableRequestDto> get copyWith => _$UnProcessableRequestDtoCopyWithImpl<UnProcessableRequestDto>(this as UnProcessableRequestDto, _$identity);

  /// Serializes this UnProcessableRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnProcessableRequestDto&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.fieldErrors, fieldErrors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(fieldErrors));

@override
String toString() {
  return 'UnProcessableRequestDto(message: $message, fieldErrors: $fieldErrors)';
}


}

/// @nodoc
abstract mixin class $UnProcessableRequestDtoCopyWith<$Res>  {
  factory $UnProcessableRequestDtoCopyWith(UnProcessableRequestDto value, $Res Function(UnProcessableRequestDto) _then) = _$UnProcessableRequestDtoCopyWithImpl;
@useResult
$Res call({
 String message, Map<String, List<String>> fieldErrors
});




}
/// @nodoc
class _$UnProcessableRequestDtoCopyWithImpl<$Res>
    implements $UnProcessableRequestDtoCopyWith<$Res> {
  _$UnProcessableRequestDtoCopyWithImpl(this._self, this._then);

  final UnProcessableRequestDto _self;
  final $Res Function(UnProcessableRequestDto) _then;

/// Create a copy of UnProcessableRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? fieldErrors = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,fieldErrors: null == fieldErrors ? _self.fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,
  ));
}

}


/// Adds pattern-matching-related methods to [UnProcessableRequestDto].
extension UnProcessableRequestDtoPatterns on UnProcessableRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UnProcessableRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UnProcessableRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UnProcessableRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _UnProcessableRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UnProcessableRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _UnProcessableRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message,  Map<String, List<String>> fieldErrors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UnProcessableRequestDto() when $default != null:
return $default(_that.message,_that.fieldErrors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message,  Map<String, List<String>> fieldErrors)  $default,) {final _that = this;
switch (_that) {
case _UnProcessableRequestDto():
return $default(_that.message,_that.fieldErrors);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message,  Map<String, List<String>> fieldErrors)?  $default,) {final _that = this;
switch (_that) {
case _UnProcessableRequestDto() when $default != null:
return $default(_that.message,_that.fieldErrors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UnProcessableRequestDto implements UnProcessableRequestDto {
  const _UnProcessableRequestDto({required this.message, required final  Map<String, List<String>> fieldErrors}): _fieldErrors = fieldErrors;
  factory _UnProcessableRequestDto.fromJson(Map<String, dynamic> json) => _$UnProcessableRequestDtoFromJson(json);

@override final  String message;
 final  Map<String, List<String>> _fieldErrors;
@override Map<String, List<String>> get fieldErrors {
  if (_fieldErrors is EqualUnmodifiableMapView) return _fieldErrors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_fieldErrors);
}


/// Create a copy of UnProcessableRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnProcessableRequestDtoCopyWith<_UnProcessableRequestDto> get copyWith => __$UnProcessableRequestDtoCopyWithImpl<_UnProcessableRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UnProcessableRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnProcessableRequestDto&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._fieldErrors, _fieldErrors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(_fieldErrors));

@override
String toString() {
  return 'UnProcessableRequestDto(message: $message, fieldErrors: $fieldErrors)';
}


}

/// @nodoc
abstract mixin class _$UnProcessableRequestDtoCopyWith<$Res> implements $UnProcessableRequestDtoCopyWith<$Res> {
  factory _$UnProcessableRequestDtoCopyWith(_UnProcessableRequestDto value, $Res Function(_UnProcessableRequestDto) _then) = __$UnProcessableRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String message, Map<String, List<String>> fieldErrors
});




}
/// @nodoc
class __$UnProcessableRequestDtoCopyWithImpl<$Res>
    implements _$UnProcessableRequestDtoCopyWith<$Res> {
  __$UnProcessableRequestDtoCopyWithImpl(this._self, this._then);

  final _UnProcessableRequestDto _self;
  final $Res Function(_UnProcessableRequestDto) _then;

/// Create a copy of UnProcessableRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? fieldErrors = null,}) {
  return _then(_UnProcessableRequestDto(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,fieldErrors: null == fieldErrors ? _self._fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,
  ));
}


}

// dart format on
