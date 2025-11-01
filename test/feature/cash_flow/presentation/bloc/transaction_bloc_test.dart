import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ultimate_finance_app/feature/cash_flow/data/models/transaction.dart'
    as model;
import 'package:ultimate_finance_app/feature/cash_flow/presentation/bloc/transaction_bloc.dart';
import 'package:ultimate_finance_app/feature/cash_flow/presentation/bloc/transaction_event.dart';
import 'package:ultimate_finance_app/feature/cash_flow/presentation/bloc/transaction_state.dart';

// Mocks
class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

void main() {
  setUpAll(() {
    registerFallbackValue(
      model.Transaction(
        id: 0,
        transactionGroupId: 0,
        amount: 0.0,
        issueDateTime: DateTime.now(),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        deletedAt: null,
      ),
    );
  });

  group('TransactionBloc', () {
    late MockFirebaseFirestore mockFirestore;

    setUp(() {
      mockFirestore = MockFirebaseFirestore();
    });

    TransactionBloc createBloc() {
      return TransactionBloc(mockFirestore);
    }

    test('inicializa con estado initial', () {
      // Arrange & Act
      final bloc = createBloc();

      // Assert
      expect(bloc.state, equals(const TransactionState.initial()));
    });

    blocTest<TransactionBloc, TransactionState>(
      'permanece en estado initial cuando se despacha loadTransactions',
      build: createBloc,
      act: (bloc) => bloc.add(const TransactionEvent.loadTransactions()),
      expect: () => [],
      verify: (bloc) {
        expect(bloc.state, equals(const TransactionState.initial()));
      },
    );

    blocTest<TransactionBloc, TransactionState>(
      'permanece en estado initial cuando se despacha addTransaction',
      build: createBloc,
      act: (bloc) => bloc.add(
        TransactionEvent.addTransaction(
          model.Transaction(
            id: 1,
            transactionGroupId: 101,
            amount: 150.75,
            issueDateTime: DateTime(2025, 1, 3, 14, 20),
            createdAt: DateTime(2025, 1, 3, 14, 25),
            updatedAt: DateTime(2025, 1, 3, 14, 25),
            deletedAt: null,
          ),
        ),
      ),
      expect: () => [],
      verify: (bloc) {
        expect(bloc.state, equals(const TransactionState.initial()));
      },
    );

    blocTest<TransactionBloc, TransactionState>(
      'permanece en estado initial cuando se despacha deleteTransaction',
      build: createBloc,
      act: (bloc) => bloc.add(
        const TransactionEvent.deleteTransaction('doc123'),
      ),
      expect: () => [],
      verify: (bloc) {
        expect(bloc.state, equals(const TransactionState.initial()));
      },
    );

    blocTest<TransactionBloc, TransactionState>(
      'puede recibir múltiples eventos sin cambiar de estado',
      build: createBloc,
      act: (bloc) {
        bloc.add(const TransactionEvent.loadTransactions());
        bloc.add(
          TransactionEvent.addTransaction(
            model.Transaction(
              id: 1,
              transactionGroupId: 101,
              amount: 150.75,
              issueDateTime: DateTime(2025, 1, 3, 14, 20),
              createdAt: DateTime(2025, 1, 3, 14, 25),
              updatedAt: DateTime(2025, 1, 3, 14, 25),
              deletedAt: null,
            ),
          ),
        );
        bloc.add(const TransactionEvent.deleteTransaction('doc123'));
      },
      expect: () => [],
      verify: (bloc) {
        expect(bloc.state, equals(const TransactionState.initial()));
      },
    );
  });

  group('TransactionState', () {
    test('initial state es correcto', () {
      // Arrange & Act
      const state = TransactionState.initial();

      // Assert
      expect(state, equals(const TransactionState.initial()));
    });

    test('loading state es correcto', () {
      // Arrange & Act
      const state = TransactionState.loading();

      // Assert
      expect(state, equals(const TransactionState.loading()));
    });

    test('loaded state contiene transacciones', () {
      // Arrange
      final transactions = <model.Transaction>[
        model.Transaction(
          id: 1,
          transactionGroupId: 101,
          amount: 150.75,
          issueDateTime: DateTime(2025, 1, 3, 14, 20),
          createdAt: DateTime(2025, 1, 3, 14, 25),
          updatedAt: DateTime(2025, 1, 3, 14, 25),
          deletedAt: null,
        ),
        model.Transaction(
          id: 2,
          transactionGroupId: 102,
          amount: 89.50,
          issueDateTime: DateTime(2025, 1, 5, 10, 5),
          createdAt: DateTime(2025, 1, 5, 10, 6),
          updatedAt: DateTime(2025, 1, 5, 10, 6),
          deletedAt: null,
        ),
      ];

      // Act
      final state = TransactionState.loaded(transactions);

      // Assert
      expect(state, isA<TransactionState>());
      // Verificamos que el estado loaded tiene las transacciones correctas
      state.maybeMap(
        loaded: (loadedState) {
          expect(loadedState.transactions.length, equals(2));
          expect(loadedState.transactions[0].id, equals(1));
          expect(loadedState.transactions[1].id, equals(2));
        },
        orElse: () => fail('State should be loaded'),
      );
    });

    test('loaded state puede tener lista vacía', () {
      // Arrange & Act
      final state = TransactionState.loaded([]);

      // Assert
      state.maybeMap(
        loaded: (loadedState) {
          expect(loadedState.transactions.isEmpty, isTrue);
        },
        orElse: () => fail('State should be loaded'),
      );
    });

    test('error state contiene mensaje de error', () {
      // Arrange & Act
      const errorMessage = 'Network error';
      final state = TransactionState.error(errorMessage);

      // Assert
      state.maybeMap(
        error: (errorState) {
          expect(errorState.message, equals(errorMessage));
        },
        orElse: () => fail('State should be error'),
      );
    });
  });

  group('TransactionEvent', () {
    test('loadTransactions event es correcto', () {
      // Arrange & Act
      const event = TransactionEvent.loadTransactions();

      // Assert
      expect(event, equals(const TransactionEvent.loadTransactions()));
    });

    test('addTransaction event contiene transacción', () {
      // Arrange
      final transaction = model.Transaction(
        id: 1,
        transactionGroupId: 101,
        amount: 150.75,
        issueDateTime: DateTime(2025, 1, 3, 14, 20),
        createdAt: DateTime(2025, 1, 3, 14, 25),
        updatedAt: DateTime(2025, 1, 3, 14, 25),
        deletedAt: null,
      );

      // Act
      final event = TransactionEvent.addTransaction(transaction);

      // Assert
      event.map(
        loadTransactions: (_) => fail('Should be addTransaction'),
        addTransaction: (addEvent) {
          expect(addEvent.transaction.id, equals(1));
          expect(addEvent.transaction.amount, equals(150.75));
        },
        deleteTransaction: (_) => fail('Should be addTransaction'),
      );
    });

    test('deleteTransaction event contiene id', () {
      // Arrange & Act
      const docId = 'doc123';
      final event = TransactionEvent.deleteTransaction(docId);

      // Assert
      event.map(
        loadTransactions: (_) => fail('Should be deleteTransaction'),
        addTransaction: (_) => fail('Should be deleteTransaction'),
        deleteTransaction: (deleteEvent) {
          expect(deleteEvent.id, equals(docId));
        },
      );
    });
  });
}

