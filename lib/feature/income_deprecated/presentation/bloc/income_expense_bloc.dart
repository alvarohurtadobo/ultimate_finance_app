import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultimate_finance_app/feature/income_deprecated/presentation/bloc/income_expense_event.dart';
import 'package:ultimate_finance_app/feature/income_deprecated/presentation/bloc/income_expense_state.dart';
import 'package:ultimate_finance_app/feature/income_deprecated/data/services/income_expense_repository.dart';

class IncomeExpenseBloc extends Bloc<IncomeExpenseEvent, IncomeExpenseState> {
  final IncomeExpenseRepository repository;

  IncomeExpenseBloc(this.repository) : super(TransactionLoading()) {
    on<LoadTransactions>((event, emit) async {
      try {
        emit(TransactionLoading());
        final transactions = await repository.fetchTransactions();
        emit(TransactionLoaded(transactions));
      } catch (e) {
        emit(TransactionError('Error loading transacion: $e'));
      }
    });

    on<AddTransaction>((event, emit) async {
      try {
        await repository.addTransaction(event.transaction);
        final transactions = await repository.fetchTransactions();
        emit(TransactionLoaded(transactions));
      } catch (e) {
        emit(TransactionError('Error adding transacion: $e'));
      }
    });

    on<DeleteTransaction>((event, emit) async {
      try {
        await repository.deleteTransaction(event.id);
        final transactions = await repository.fetchTransactions();
        emit(TransactionLoaded(transactions));
      } catch (e) {
        emit(TransactionError('Error deleting transacion: $e'));
      }
    });
  }
}
