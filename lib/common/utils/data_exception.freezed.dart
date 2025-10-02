// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DataException {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataException);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DataException()';
}


}

/// @nodoc
class $DataExceptionCopyWith<$Res>  {
$DataExceptionCopyWith(DataException _, $Res Function(DataException) __);
}


/// Adds pattern-matching-related methods to [DataException].
extension DataExceptionPatterns on DataException {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ConnectionError value)?  connectionError,TResult Function( TimeoutError value)?  timeoutError,TResult Function( UnauthorizedError value)?  unauthorizedError,TResult Function( CustomError value)?  customError,TResult Function( UnexpectedError value)?  unexpectedError,TResult Function( UnProcessableRequest value)?  unProcessableRequest,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ConnectionError() when connectionError != null:
return connectionError(_that);case TimeoutError() when timeoutError != null:
return timeoutError(_that);case UnauthorizedError() when unauthorizedError != null:
return unauthorizedError(_that);case CustomError() when customError != null:
return customError(_that);case UnexpectedError() when unexpectedError != null:
return unexpectedError(_that);case UnProcessableRequest() when unProcessableRequest != null:
return unProcessableRequest(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ConnectionError value)  connectionError,required TResult Function( TimeoutError value)  timeoutError,required TResult Function( UnauthorizedError value)  unauthorizedError,required TResult Function( CustomError value)  customError,required TResult Function( UnexpectedError value)  unexpectedError,required TResult Function( UnProcessableRequest value)  unProcessableRequest,}){
final _that = this;
switch (_that) {
case ConnectionError():
return connectionError(_that);case TimeoutError():
return timeoutError(_that);case UnauthorizedError():
return unauthorizedError(_that);case CustomError():
return customError(_that);case UnexpectedError():
return unexpectedError(_that);case UnProcessableRequest():
return unProcessableRequest(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ConnectionError value)?  connectionError,TResult? Function( TimeoutError value)?  timeoutError,TResult? Function( UnauthorizedError value)?  unauthorizedError,TResult? Function( CustomError value)?  customError,TResult? Function( UnexpectedError value)?  unexpectedError,TResult? Function( UnProcessableRequest value)?  unProcessableRequest,}){
final _that = this;
switch (_that) {
case ConnectionError() when connectionError != null:
return connectionError(_that);case TimeoutError() when timeoutError != null:
return timeoutError(_that);case UnauthorizedError() when unauthorizedError != null:
return unauthorizedError(_that);case CustomError() when customError != null:
return customError(_that);case UnexpectedError() when unexpectedError != null:
return unexpectedError(_that);case UnProcessableRequest() when unProcessableRequest != null:
return unProcessableRequest(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  connectionError,TResult Function()?  timeoutError,TResult Function( int codeError)?  unauthorizedError,TResult Function( String message)?  customError,TResult Function( UnexpectedErrorDto? data)?  unexpectedError,TResult Function( int httpCode,  UnProcessableRequestDto data)?  unProcessableRequest,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ConnectionError() when connectionError != null:
return connectionError();case TimeoutError() when timeoutError != null:
return timeoutError();case UnauthorizedError() when unauthorizedError != null:
return unauthorizedError(_that.codeError);case CustomError() when customError != null:
return customError(_that.message);case UnexpectedError() when unexpectedError != null:
return unexpectedError(_that.data);case UnProcessableRequest() when unProcessableRequest != null:
return unProcessableRequest(_that.httpCode,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  connectionError,required TResult Function()  timeoutError,required TResult Function( int codeError)  unauthorizedError,required TResult Function( String message)  customError,required TResult Function( UnexpectedErrorDto? data)  unexpectedError,required TResult Function( int httpCode,  UnProcessableRequestDto data)  unProcessableRequest,}) {final _that = this;
switch (_that) {
case ConnectionError():
return connectionError();case TimeoutError():
return timeoutError();case UnauthorizedError():
return unauthorizedError(_that.codeError);case CustomError():
return customError(_that.message);case UnexpectedError():
return unexpectedError(_that.data);case UnProcessableRequest():
return unProcessableRequest(_that.httpCode,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  connectionError,TResult? Function()?  timeoutError,TResult? Function( int codeError)?  unauthorizedError,TResult? Function( String message)?  customError,TResult? Function( UnexpectedErrorDto? data)?  unexpectedError,TResult? Function( int httpCode,  UnProcessableRequestDto data)?  unProcessableRequest,}) {final _that = this;
switch (_that) {
case ConnectionError() when connectionError != null:
return connectionError();case TimeoutError() when timeoutError != null:
return timeoutError();case UnauthorizedError() when unauthorizedError != null:
return unauthorizedError(_that.codeError);case CustomError() when customError != null:
return customError(_that.message);case UnexpectedError() when unexpectedError != null:
return unexpectedError(_that.data);case UnProcessableRequest() when unProcessableRequest != null:
return unProcessableRequest(_that.httpCode,_that.data);case _:
  return null;

}
}

}

/// @nodoc


class ConnectionError implements DataException {
  const ConnectionError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DataException.connectionError()';
}


}




/// @nodoc


class TimeoutError implements DataException {
  const TimeoutError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeoutError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DataException.timeoutError()';
}


}




/// @nodoc


class UnauthorizedError implements DataException {
  const UnauthorizedError(this.codeError);
  

 final  int codeError;

/// Create a copy of DataException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnauthorizedErrorCopyWith<UnauthorizedError> get copyWith => _$UnauthorizedErrorCopyWithImpl<UnauthorizedError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnauthorizedError&&(identical(other.codeError, codeError) || other.codeError == codeError));
}


@override
int get hashCode => Object.hash(runtimeType,codeError);

@override
String toString() {
  return 'DataException.unauthorizedError(codeError: $codeError)';
}


}

/// @nodoc
abstract mixin class $UnauthorizedErrorCopyWith<$Res> implements $DataExceptionCopyWith<$Res> {
  factory $UnauthorizedErrorCopyWith(UnauthorizedError value, $Res Function(UnauthorizedError) _then) = _$UnauthorizedErrorCopyWithImpl;
@useResult
$Res call({
 int codeError
});




}
/// @nodoc
class _$UnauthorizedErrorCopyWithImpl<$Res>
    implements $UnauthorizedErrorCopyWith<$Res> {
  _$UnauthorizedErrorCopyWithImpl(this._self, this._then);

  final UnauthorizedError _self;
  final $Res Function(UnauthorizedError) _then;

/// Create a copy of DataException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? codeError = null,}) {
  return _then(UnauthorizedError(
null == codeError ? _self.codeError : codeError // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class CustomError implements DataException {
  const CustomError(this.message);
  

 final  String message;

/// Create a copy of DataException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomErrorCopyWith<CustomError> get copyWith => _$CustomErrorCopyWithImpl<CustomError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DataException.customError(message: $message)';
}


}

/// @nodoc
abstract mixin class $CustomErrorCopyWith<$Res> implements $DataExceptionCopyWith<$Res> {
  factory $CustomErrorCopyWith(CustomError value, $Res Function(CustomError) _then) = _$CustomErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CustomErrorCopyWithImpl<$Res>
    implements $CustomErrorCopyWith<$Res> {
  _$CustomErrorCopyWithImpl(this._self, this._then);

  final CustomError _self;
  final $Res Function(CustomError) _then;

/// Create a copy of DataException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CustomError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UnexpectedError implements DataException {
  const UnexpectedError({this.data});
  

 final  UnexpectedErrorDto? data;

/// Create a copy of DataException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnexpectedErrorCopyWith<UnexpectedError> get copyWith => _$UnexpectedErrorCopyWithImpl<UnexpectedError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnexpectedError&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'DataException.unexpectedError(data: $data)';
}


}

/// @nodoc
abstract mixin class $UnexpectedErrorCopyWith<$Res> implements $DataExceptionCopyWith<$Res> {
  factory $UnexpectedErrorCopyWith(UnexpectedError value, $Res Function(UnexpectedError) _then) = _$UnexpectedErrorCopyWithImpl;
@useResult
$Res call({
 UnexpectedErrorDto? data
});




}
/// @nodoc
class _$UnexpectedErrorCopyWithImpl<$Res>
    implements $UnexpectedErrorCopyWith<$Res> {
  _$UnexpectedErrorCopyWithImpl(this._self, this._then);

  final UnexpectedError _self;
  final $Res Function(UnexpectedError) _then;

/// Create a copy of DataException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(UnexpectedError(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UnexpectedErrorDto?,
  ));
}


}

/// @nodoc


class UnProcessableRequest implements DataException {
  const UnProcessableRequest(this.httpCode, this.data);
  

 final  int httpCode;
 final  UnProcessableRequestDto data;

/// Create a copy of DataException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnProcessableRequestCopyWith<UnProcessableRequest> get copyWith => _$UnProcessableRequestCopyWithImpl<UnProcessableRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnProcessableRequest&&(identical(other.httpCode, httpCode) || other.httpCode == httpCode)&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,httpCode,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'DataException.unProcessableRequest(httpCode: $httpCode, data: $data)';
}


}

/// @nodoc
abstract mixin class $UnProcessableRequestCopyWith<$Res> implements $DataExceptionCopyWith<$Res> {
  factory $UnProcessableRequestCopyWith(UnProcessableRequest value, $Res Function(UnProcessableRequest) _then) = _$UnProcessableRequestCopyWithImpl;
@useResult
$Res call({
 int httpCode, UnProcessableRequestDto data
});




}
/// @nodoc
class _$UnProcessableRequestCopyWithImpl<$Res>
    implements $UnProcessableRequestCopyWith<$Res> {
  _$UnProcessableRequestCopyWithImpl(this._self, this._then);

  final UnProcessableRequest _self;
  final $Res Function(UnProcessableRequest) _then;

/// Create a copy of DataException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? httpCode = null,Object? data = freezed,}) {
  return _then(UnProcessableRequest(
null == httpCode ? _self.httpCode : httpCode // ignore: cast_nullable_to_non_nullable
as int,freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UnProcessableRequestDto,
  ));
}


}

// dart format on
