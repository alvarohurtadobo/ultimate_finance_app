// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'domain_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DomainException {

 String get message; int get code; DataException get exceptionType; Payload? get payload;
/// Create a copy of DomainException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DomainExceptionCopyWith<DomainException> get copyWith => _$DomainExceptionCopyWithImpl<DomainException>(this as DomainException, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DomainException&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.exceptionType, exceptionType)&&const DeepCollectionEquality().equals(other.payload, payload));
}


@override
int get hashCode => Object.hash(runtimeType,message,code,const DeepCollectionEquality().hash(exceptionType),const DeepCollectionEquality().hash(payload));

@override
String toString() {
  return 'DomainException(message: $message, code: $code, exceptionType: $exceptionType, payload: $payload)';
}


}

/// @nodoc
abstract mixin class $DomainExceptionCopyWith<$Res>  {
  factory $DomainExceptionCopyWith(DomainException value, $Res Function(DomainException) _then) = _$DomainExceptionCopyWithImpl;
@useResult
$Res call({
 String message, int code, DataException exceptionType, Payload? payload
});




}
/// @nodoc
class _$DomainExceptionCopyWithImpl<$Res>
    implements $DomainExceptionCopyWith<$Res> {
  _$DomainExceptionCopyWithImpl(this._self, this._then);

  final DomainException _self;
  final $Res Function(DomainException) _then;

/// Create a copy of DomainException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? code = null,Object? exceptionType = freezed,Object? payload = freezed,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,exceptionType: freezed == exceptionType ? _self.exceptionType : exceptionType // ignore: cast_nullable_to_non_nullable
as DataException,payload: freezed == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as Payload?,
  ));
}

}


/// Adds pattern-matching-related methods to [DomainException].
extension DomainExceptionPatterns on DomainException {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DomainException value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DomainException() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DomainException value)  $default,){
final _that = this;
switch (_that) {
case _DomainException():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DomainException value)?  $default,){
final _that = this;
switch (_that) {
case _DomainException() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message,  int code,  DataException exceptionType,  Payload? payload)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DomainException() when $default != null:
return $default(_that.message,_that.code,_that.exceptionType,_that.payload);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message,  int code,  DataException exceptionType,  Payload? payload)  $default,) {final _that = this;
switch (_that) {
case _DomainException():
return $default(_that.message,_that.code,_that.exceptionType,_that.payload);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message,  int code,  DataException exceptionType,  Payload? payload)?  $default,) {final _that = this;
switch (_that) {
case _DomainException() when $default != null:
return $default(_that.message,_that.code,_that.exceptionType,_that.payload);case _:
  return null;

}
}

}

/// @nodoc


class _DomainException implements DomainException {
  const _DomainException({this.message = '', this.code = 0, required this.exceptionType, this.payload = null});
  

@override@JsonKey() final  String message;
@override@JsonKey() final  int code;
@override final  DataException exceptionType;
@override@JsonKey() final  Payload? payload;

/// Create a copy of DomainException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DomainExceptionCopyWith<_DomainException> get copyWith => __$DomainExceptionCopyWithImpl<_DomainException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DomainException&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.exceptionType, exceptionType)&&const DeepCollectionEquality().equals(other.payload, payload));
}


@override
int get hashCode => Object.hash(runtimeType,message,code,const DeepCollectionEquality().hash(exceptionType),const DeepCollectionEquality().hash(payload));

@override
String toString() {
  return 'DomainException(message: $message, code: $code, exceptionType: $exceptionType, payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$DomainExceptionCopyWith<$Res> implements $DomainExceptionCopyWith<$Res> {
  factory _$DomainExceptionCopyWith(_DomainException value, $Res Function(_DomainException) _then) = __$DomainExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message, int code, DataException exceptionType, Payload? payload
});




}
/// @nodoc
class __$DomainExceptionCopyWithImpl<$Res>
    implements _$DomainExceptionCopyWith<$Res> {
  __$DomainExceptionCopyWithImpl(this._self, this._then);

  final _DomainException _self;
  final $Res Function(_DomainException) _then;

/// Create a copy of DomainException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? code = null,Object? exceptionType = freezed,Object? payload = freezed,}) {
  return _then(_DomainException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,exceptionType: freezed == exceptionType ? _self.exceptionType : exceptionType // ignore: cast_nullable_to_non_nullable
as DataException,payload: freezed == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as Payload?,
  ));
}


}

// dart format on
