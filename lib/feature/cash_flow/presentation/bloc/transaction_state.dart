import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ultimate_finance_app/feature/cash_flow/data/models/transaction.dart';

part 'transaction_state.freezed.dart';

@freezed
class TransactionState with _$TransactionState {
  const factory TransactionState.initial() = _Initial;
  const factory TransactionState.loading() = _Loading;
  const factory TransactionState.loaded(List<Transaction> transactions) =
      _Loaded;
  const factory TransactionState.error(String message) = _Error;
}
