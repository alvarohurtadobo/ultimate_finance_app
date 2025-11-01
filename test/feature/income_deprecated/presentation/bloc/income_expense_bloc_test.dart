import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ultimate_finance_app/feature/income_deprecated/data/model/income_expense_model.dart';
import 'package:ultimate_finance_app/feature/income_deprecated/data/services/income_expense_repository.dart';
import 'package:ultimate_finance_app/feature/income_deprecated/presentation/bloc/income_expense_bloc.dart';
import 'package:ultimate_finance_app/feature/income_deprecated/presentation/bloc/income_expense_event.dart';
import 'package:ultimate_finance_app/feature/income_deprecated/presentation/bloc/income_expense_state.dart';

// Mocks
class MockIncomeExpenseRepository extends Mock
    implements IncomeExpenseRepository {}

void main() {
  setUpAll(() {
    registerFallbackValue(
      IncomeExpense(
        amount: 0,
        description: '',
        date: DateTime.now(),
        type: 'income',
      ),
    );
  });

  group('IncomeExpenseBloc', () {
    late MockIncomeExpenseRepository mockRepository;

    setUp(() {
      mockRepository = MockIncomeExpenseRepository();
    });

    IncomeExpenseBloc createBloc() {
      return IncomeExpenseBloc(mockRepository);
    }

    group('LoadTransactions', () {
      blocTest<IncomeExpenseBloc, IncomeExpenseState>(
        'emite [TransactionLoading, TransactionLoaded] cuando carga exitosamente',
        build: () {
          final transactions = [
            IncomeExpense(
              id: '1',
              amount: 1000,
              description: 'Salary',
              date: DateTime(2024, 1, 1),
              type: 'income',
            ),
            IncomeExpense(
              id: '2',
              amount: 500,
              description: 'Rent',
              date: DateTime(2024, 1, 2),
              type: 'expense',
            ),
          ];
          when(() => mockRepository.fetchTransactions())
              .thenAnswer((_) async => transactions);
          return createBloc();
        },
        act: (bloc) => bloc.add(LoadTransactions()),
        expect: () => [
          isA<TransactionLoading>(),
          isA<TransactionLoaded>(),
        ],
        verify: (bloc) {
          final state = bloc.state;
          expect(state, isA<TransactionLoaded>());
          if (state is TransactionLoaded) {
            expect(state.transactions.length, equals(2));
            expect(state.transactions[0].amount, equals(1000));
            expect(state.transactions[1].amount, equals(500));
          }
          verify(() => mockRepository.fetchTransactions()).called(1);
        },
      );

      blocTest<IncomeExpenseBloc, IncomeExpenseState>(
        'emite [TransactionLoading, TransactionLoaded] con lista vacía cuando no hay transacciones',
        build: () {
          when(() => mockRepository.fetchTransactions())
              .thenAnswer((_) async => <IncomeExpense>[]);
          return createBloc();
        },
        act: (bloc) => bloc.add(LoadTransactions()),
        expect: () => [
          isA<TransactionLoading>(),
          isA<TransactionLoaded>(),
        ],
        verify: (bloc) {
          final state = bloc.state;
          expect(state, isA<TransactionLoaded>());
          if (state is TransactionLoaded) {
            expect(state.transactions.isEmpty, isTrue);
          }
        },
      );

      blocTest<IncomeExpenseBloc, IncomeExpenseState>(
        'emite [TransactionLoading, TransactionError] cuando falla la carga',
        build: () {
          when(() => mockRepository.fetchTransactions())
              .thenThrow(Exception('Network error'));
          return createBloc();
        },
        act: (bloc) => bloc.add(LoadTransactions()),
        expect: () => [
          isA<TransactionLoading>(),
          isA<TransactionError>(),
        ],
        verify: (bloc) {
          final state = bloc.state;
          expect(state, isA<TransactionError>());
          if (state is TransactionError) {
            expect(state.message, contains('Error loading transacion'));
          }
          verify(() => mockRepository.fetchTransactions()).called(1);
        },
      );
    });

    group('AddTransaction', () {
      blocTest<IncomeExpenseBloc, IncomeExpenseState>(
        'emite [TransactionLoaded] cuando agrega exitosamente',
        build: () {
          final existingTransactions = [
            IncomeExpense(
              id: '1',
              amount: 1000,
              description: 'Salary',
              date: DateTime(2024, 1, 1),
              type: 'income',
            ),
          ];
          final updatedTransactions = [
            ...existingTransactions,
            IncomeExpense(
              id: '2',
              amount: 1500,
              description: 'Bonus',
              date: DateTime(2024, 1, 15),
              type: 'income',
            ),
          ];

          when(() => mockRepository.addTransaction(any()))
              .thenAnswer((_) async => {});
          when(() => mockRepository.fetchTransactions())
              .thenAnswer((_) async => updatedTransactions);
          return createBloc();
        },
        seed: () => TransactionLoaded([
          IncomeExpense(
            id: '1',
            amount: 1000,
            description: 'Salary',
            date: DateTime(2024, 1, 1),
            type: 'income',
          ),
        ]),
        act: (bloc) => bloc.add(
          AddTransaction(
            IncomeExpense(
              amount: 1500,
              description: 'Bonus',
              date: DateTime(2024, 1, 15),
              type: 'income',
            ),
          ),
        ),
        expect: () => [
          isA<TransactionLoading>(),
          isA<TransactionLoaded>(),
        ],
        verify: (bloc) {
          final state = bloc.state;
          expect(state, isA<TransactionLoaded>());
          if (state is TransactionLoaded) {
            expect(state.transactions.length, equals(2));
          }
          verify(() => mockRepository.addTransaction(any())).called(1);
          verify(() => mockRepository.fetchTransactions()).called(1);
        },
      );

      blocTest<IncomeExpenseBloc, IncomeExpenseState>(
        'emite [TransactionError] cuando falla al agregar',
        build: () {
          when(() => mockRepository.addTransaction(any()))
              .thenThrow(Exception('Database error'));
          return createBloc();
        },
        act: (bloc) => bloc.add(
          AddTransaction(
            IncomeExpense(
              amount: 1500,
              description: 'Bonus',
              date: DateTime(2024, 1, 15),
              type: 'income',
            ),
          ),
        ),
        expect: () => [
          isA<TransactionError>(),
        ],
        verify: (bloc) {
          final state = bloc.state;
          expect(state, isA<TransactionError>());
          if (state is TransactionError) {
            expect(state.message, contains('Error adding transacion'));
          }
          verify(() => mockRepository.addTransaction(any())).called(1);
        },
      );
    });

    group('DeleteTransaction', () {
      blocTest<IncomeExpenseBloc, IncomeExpenseState>(
        'emite [TransactionLoaded] cuando elimina exitosamente',
        build: () {
          final remainingTransactions = [
            IncomeExpense(
              id: '2',
              amount: 500,
              description: 'Rent',
              date: DateTime(2024, 1, 2),
              type: 'expense',
            ),
          ];

          when(() => mockRepository.deleteTransaction(any()))
              .thenAnswer((_) async => {});
          when(() => mockRepository.fetchTransactions())
              .thenAnswer((_) async => remainingTransactions);
          return createBloc();
        },
        act: (bloc) => bloc.add(DeleteTransaction('1')),
        expect: () => [
          isA<TransactionLoaded>(),
        ],
        setUp: () {
          final transactions = [
            IncomeExpense(
              id: '1',
              amount: 1000,
              description: 'Salary',
              date: DateTime(2024, 1, 1),
              type: 'income',
            ),
            IncomeExpense(
              id: '2',
              amount: 500,
              description: 'Rent',
              date: DateTime(2024, 1, 2),
              type: 'expense',
            ),
          ];
          when(() => mockRepository.fetchTransactions())
              .thenAnswer((_) async => transactions);
        },
        verify: (bloc) {
          final state = bloc.state;
          expect(state, isA<TransactionLoaded>());
          if (state is TransactionLoaded) {
            expect(state.transactions.length, equals(1));
            expect(state.transactions[0].id, equals('2'));
          }
          verify(() => mockRepository.deleteTransaction('1')).called(1);
          verify(() => mockRepository.fetchTransactions()).called(1);
        },
      );

      blocTest<IncomeExpenseBloc, IncomeExpenseState>(
        'emite [TransactionError] cuando falla al eliminar',
        build: () {
          when(() => mockRepository.deleteTransaction(any()))
              .thenThrow(Exception('Delete error'));
          return createBloc();
        },
        act: (bloc) => bloc.add(DeleteTransaction('1')),
        expect: () => [
          isA<TransactionError>(),
        ],
        verify: (bloc) {
          final state = bloc.state;
          expect(state, isA<TransactionError>());
          if (state is TransactionError) {
            expect(state.message, contains('Error deleting transacion'));
          }
          verify(() => mockRepository.deleteTransaction('1')).called(1);
        },
      );
    });
  });
}

