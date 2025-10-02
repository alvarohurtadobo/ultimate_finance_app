import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ultimate_finance_app/feature/cash_flow/data/models/transaction.dart';

part 'transaction_event.freezed.dart';

@freezed
class TransactionEvent with _$TransactionEvent {
  const factory TransactionEvent.loadTransactions() = _LoadTransactions;
  const factory TransactionEvent.addTransaction(Transaction transaction) =
      _AddTransactions;
  const factory TransactionEvent.deleteTransaction(String id) =
      _DeleteTransaction;
}
