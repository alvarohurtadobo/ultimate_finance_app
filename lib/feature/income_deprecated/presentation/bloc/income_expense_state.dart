import 'package:ultimate_finance_app/feature/income_deprecated/data/model/income_expense_model.dart';

abstract class IncomeExpenseState {}

class TransactionLoading extends IncomeExpenseState {}

class TransactionLoaded extends IncomeExpenseState {
  final List<IncomeExpense> transactions;

  TransactionLoaded(this.transactions);
}

class TransactionError extends IncomeExpenseState {
  final String message;

  TransactionError(this.message);
}
