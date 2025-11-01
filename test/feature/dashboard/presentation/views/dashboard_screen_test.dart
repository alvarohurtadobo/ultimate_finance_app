import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ultimate_finance_app/feature/dashboard/presentation/views/dashboard_screen.dart';
import 'package:ultimate_finance_app/feature/income_deprecated/data/model/income_expense_model.dart';
import 'package:ultimate_finance_app/feature/income_deprecated/presentation/bloc/income_expense_bloc.dart';
import 'package:ultimate_finance_app/feature/income_deprecated/presentation/bloc/income_expense_event.dart';
import 'package:ultimate_finance_app/feature/income_deprecated/presentation/bloc/income_expense_state.dart';

// Mock BLoC
class MockIncomeExpenseBloc extends MockBloc<IncomeExpenseEvent, IncomeExpenseState>
    implements IncomeExpenseBloc {}

void main() {
  group('DashboardScreen', () {
    late MockIncomeExpenseBloc mockBloc;

    setUp(() {
      mockBloc = MockIncomeExpenseBloc();
    });

    Widget createTestWidget() {
      return MaterialApp(
        home: BlocProvider<IncomeExpenseBloc>.value(
          value: mockBloc,
          child: const DashboardScreen(),
        ),
      );
    }

    testWidgets('muestra CupertinoActivityIndicator cuando el estado es TransactionLoading',
        (WidgetTester tester) async {
      // Arrange
      when(() => mockBloc.state).thenReturn(TransactionLoading());

      // Act
      await tester.pumpWidget(createTestWidget());

      // Assert
      expect(find.byType(CupertinoActivityIndicator), findsOneWidget);
      expect(find.text('Dashboard'), findsOneWidget);
    });

    testWidgets('muestra datos correctamente cuando el estado es TransactionLoaded',
        (WidgetTester tester) async {
      // Arrange
      final transactions = [
        IncomeExpense(
          id: '1',
          amount: 5000,
          description: 'Salary',
          date: DateTime(2024, 1, 1),
          type: 'income',
        ),
        IncomeExpense(
          id: '2',
          amount: 2000,
          description: 'Rent',
          date: DateTime(2024, 1, 2),
          type: 'expense',
        ),
        IncomeExpense(
          id: '3',
          amount: 1000,
          description: 'Bonus',
          date: DateTime(2024, 1, 3),
          type: 'income',
        ),
      ];
      when(() => mockBloc.state).thenReturn(TransactionLoaded(transactions));

      // Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert
      // Total income: 5000 + 1000 = 6000
      expect(find.textContaining('6000'), findsWidgets);
      // Total expense: 2000
      expect(find.textContaining('2000'), findsWidgets);
      // Available balance: 6000 - 2000 = 4000
      expect(find.textContaining('4000'), findsWidgets);
      // Budget for month: 6000 * 0.7 = 4200
      expect(find.textContaining('4200'), findsWidgets);
      
      // Verificar que se muestran las tarjetas
      expect(find.text('Available balance'), findsOneWidget);
      expect(find.text('Budget for October'), findsOneWidget);
      expect(find.text('Income'), findsOneWidget);
      expect(find.text('Expense'), findsOneWidget);
    });

    testWidgets('calcula correctamente con múltiples ingresos y gastos',
        (WidgetTester tester) async {
      // Arrange
      final transactions = [
        IncomeExpense(
          id: '1',
          amount: 1000,
          description: 'Salary 1',
          date: DateTime(2024, 1, 1),
          type: 'income',
        ),
        IncomeExpense(
          id: '2',
          amount: 500,
          description: 'Salary 2',
          date: DateTime(2024, 1, 2),
          type: 'income',
        ),
        IncomeExpense(
          id: '3',
          amount: 300,
          description: 'Rent',
          date: DateTime(2024, 1, 3),
          type: 'expense',
        ),
        IncomeExpense(
          id: '4',
          amount: 200,
          description: 'Food',
          date: DateTime(2024, 1, 4),
          type: 'expense',
        ),
      ];
      when(() => mockBloc.state).thenReturn(TransactionLoaded(transactions));

      // Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert
      // Total income: 1000 + 500 = 1500
      expect(find.textContaining('1500'), findsWidgets);
      // Total expense: 300 + 200 = 500
      expect(find.textContaining('500'), findsWidgets);
      // Available balance: 1500 - 500 = 1000
      expect(find.textContaining('1000'), findsWidgets);
      // Budget for month: 1500 * 0.7 = 1050
      expect(find.textContaining('1050'), findsWidgets);
    });

    testWidgets('muestra mensaje de error cuando el estado es TransactionError',
        (WidgetTester tester) async {
      // Arrange
      when(() => mockBloc.state)
          .thenReturn(TransactionError('Network error'));

      // Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert
      expect(find.textContaining('Error loading data: Network error'), findsOneWidget);
    });

    testWidgets('muestra "No data available" cuando el estado no es reconocido',
        (WidgetTester tester) async {
      // Arrange
      // Crear un estado desconocido (mock)
      final unknownState = _UnknownState();
      when(() => mockBloc.state).thenReturn(unknownState);

      // Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('No data available'), findsOneWidget);
    });

    testWidgets('muestra cero cuando no hay transacciones',
        (WidgetTester tester) async {
      // Arrange
      when(() => mockBloc.state).thenReturn(TransactionLoaded([]));

      // Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert
      // Todos los valores deberían ser 0
      expect(find.textContaining('0'), findsWidgets);
      expect(find.text('Available balance'), findsOneWidget);
      expect(find.text('Budget for October'), findsOneWidget);
    });

    testWidgets('muestra solo ingresos cuando no hay gastos',
        (WidgetTester tester) async {
      // Arrange
      final transactions = [
        IncomeExpense(
          id: '1',
          amount: 5000,
          description: 'Salary',
          date: DateTime(2024, 1, 1),
          type: 'income',
        ),
      ];
      when(() => mockBloc.state).thenReturn(TransactionLoaded(transactions));

      // Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert
      // Total income: 5000
      expect(find.textContaining('5000'), findsWidgets);
      // Total expense: 0
      expect(find.textContaining('0'), findsWidgets);
      // Available balance: 5000 - 0 = 5000
      expect(find.textContaining('5000'), findsWidgets);
      // Budget: 5000 * 0.7 = 3500
      expect(find.textContaining('3500'), findsWidgets);
    });

    testWidgets('tiene la barra de navegación correcta',
        (WidgetTester tester) async {
      // Arrange
      when(() => mockBloc.state).thenReturn(TransactionLoading());

      // Act
      await tester.pumpWidget(createTestWidget());

      // Assert
      expect(find.byType(CupertinoNavigationBar), findsOneWidget);
      expect(find.text('Dashboard'), findsOneWidget);
    });

    testWidgets('muestra el botón Create a Saving Goal',
        (WidgetTester tester) async {
      // Arrange
      when(() => mockBloc.state).thenReturn(TransactionLoaded([]));

      // Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Create a Saving Goal'), findsOneWidget);
      expect(find.byType(CupertinoButton), findsOneWidget);
    });
  });
}

// Estado desconocido para testing
class _UnknownState extends IncomeExpenseState {}

