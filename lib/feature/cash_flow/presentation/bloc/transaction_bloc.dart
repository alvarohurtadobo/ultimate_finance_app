import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultimate_finance_app/feature/cash_flow/presentation/bloc/transaction_event.dart';
import 'package:ultimate_finance_app/feature/cash_flow/presentation/bloc/transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final FirebaseFirestore instance;

  TransactionBloc(this.instance) : super(const TransactionState.initial()) {
    on<TransactionEvent>((event, emit) async {
      // emit(const TransactionState.loading());
      // emit(const TransactionState.loaded([]));
      await event.map(
        loadTransactions: (e) {},
        addTransaction: (e) {},
        deleteTransaction: (e) {},
      );
    });

    // on<_AddTransactions>((event, emit) {});

    // on<_DeleteTransaction>((event, emit) {});
  }
}
