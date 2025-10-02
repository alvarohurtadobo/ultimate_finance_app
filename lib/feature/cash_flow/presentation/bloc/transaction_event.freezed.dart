// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionEvent()';
}


}

/// @nodoc
class $TransactionEventCopyWith<$Res>  {
$TransactionEventCopyWith(TransactionEvent _, $Res Function(TransactionEvent) __);
}


/// Adds pattern-matching-related methods to [TransactionEvent].
extension TransactionEventPatterns on TransactionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadTransactions value)?  loadTransactions,TResult Function( _AddTransactions value)?  addTransaction,TResult Function( _DeleteTransaction value)?  deleteTransaction,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadTransactions() when loadTransactions != null:
return loadTransactions(_that);case _AddTransactions() when addTransaction != null:
return addTransaction(_that);case _DeleteTransaction() when deleteTransaction != null:
return deleteTransaction(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadTransactions value)  loadTransactions,required TResult Function( _AddTransactions value)  addTransaction,required TResult Function( _DeleteTransaction value)  deleteTransaction,}){
final _that = this;
switch (_that) {
case _LoadTransactions():
return loadTransactions(_that);case _AddTransactions():
return addTransaction(_that);case _DeleteTransaction():
return deleteTransaction(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadTransactions value)?  loadTransactions,TResult? Function( _AddTransactions value)?  addTransaction,TResult? Function( _DeleteTransaction value)?  deleteTransaction,}){
final _that = this;
switch (_that) {
case _LoadTransactions() when loadTransactions != null:
return loadTransactions(_that);case _AddTransactions() when addTransaction != null:
return addTransaction(_that);case _DeleteTransaction() when deleteTransaction != null:
return deleteTransaction(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadTransactions,TResult Function( Transaction transaction)?  addTransaction,TResult Function( String id)?  deleteTransaction,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadTransactions() when loadTransactions != null:
return loadTransactions();case _AddTransactions() when addTransaction != null:
return addTransaction(_that.transaction);case _DeleteTransaction() when deleteTransaction != null:
return deleteTransaction(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadTransactions,required TResult Function( Transaction transaction)  addTransaction,required TResult Function( String id)  deleteTransaction,}) {final _that = this;
switch (_that) {
case _LoadTransactions():
return loadTransactions();case _AddTransactions():
return addTransaction(_that.transaction);case _DeleteTransaction():
return deleteTransaction(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadTransactions,TResult? Function( Transaction transaction)?  addTransaction,TResult? Function( String id)?  deleteTransaction,}) {final _that = this;
switch (_that) {
case _LoadTransactions() when loadTransactions != null:
return loadTransactions();case _AddTransactions() when addTransaction != null:
return addTransaction(_that.transaction);case _DeleteTransaction() when deleteTransaction != null:
return deleteTransaction(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _LoadTransactions implements TransactionEvent {
  const _LoadTransactions();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadTransactions);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionEvent.loadTransactions()';
}


}




/// @nodoc


class _AddTransactions implements TransactionEvent {
  const _AddTransactions(this.transaction);
  

 final  Transaction transaction;

/// Create a copy of TransactionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddTransactionsCopyWith<_AddTransactions> get copyWith => __$AddTransactionsCopyWithImpl<_AddTransactions>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddTransactions&&(identical(other.transaction, transaction) || other.transaction == transaction));
}


@override
int get hashCode => Object.hash(runtimeType,transaction);

@override
String toString() {
  return 'TransactionEvent.addTransaction(transaction: $transaction)';
}


}

/// @nodoc
abstract mixin class _$AddTransactionsCopyWith<$Res> implements $TransactionEventCopyWith<$Res> {
  factory _$AddTransactionsCopyWith(_AddTransactions value, $Res Function(_AddTransactions) _then) = __$AddTransactionsCopyWithImpl;
@useResult
$Res call({
 Transaction transaction
});




}
/// @nodoc
class __$AddTransactionsCopyWithImpl<$Res>
    implements _$AddTransactionsCopyWith<$Res> {
  __$AddTransactionsCopyWithImpl(this._self, this._then);

  final _AddTransactions _self;
  final $Res Function(_AddTransactions) _then;

/// Create a copy of TransactionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? transaction = null,}) {
  return _then(_AddTransactions(
null == transaction ? _self.transaction : transaction // ignore: cast_nullable_to_non_nullable
as Transaction,
  ));
}


}

/// @nodoc


class _DeleteTransaction implements TransactionEvent {
  const _DeleteTransaction(this.id);
  

 final  String id;

/// Create a copy of TransactionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteTransactionCopyWith<_DeleteTransaction> get copyWith => __$DeleteTransactionCopyWithImpl<_DeleteTransaction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteTransaction&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'TransactionEvent.deleteTransaction(id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeleteTransactionCopyWith<$Res> implements $TransactionEventCopyWith<$Res> {
  factory _$DeleteTransactionCopyWith(_DeleteTransaction value, $Res Function(_DeleteTransaction) _then) = __$DeleteTransactionCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class __$DeleteTransactionCopyWithImpl<$Res>
    implements _$DeleteTransactionCopyWith<$Res> {
  __$DeleteTransactionCopyWithImpl(this._self, this._then);

  final _DeleteTransaction _self;
  final $Res Function(_DeleteTransaction) _then;

/// Create a copy of TransactionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_DeleteTransaction(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
