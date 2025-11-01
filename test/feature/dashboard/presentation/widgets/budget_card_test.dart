import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ultimate_finance_app/feature/dashboard/presentation/widgets/budget_card.dart';

void main() {
  group('BudgetCard', () {
    testWidgets('muestra título y monto correctamente', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: BudgetCard(
              title: 'Income',
              amount: '\$1000',
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('Income'), findsOneWidget);
      expect(find.text('\$1000'), findsOneWidget);
    });

    testWidgets('muestra subtítulo cuando se proporciona', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: BudgetCard(
              title: 'Budget',
              amount: '\$5000',
              subtitle: 'Available',
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('Budget'), findsOneWidget);
      expect(find.text('\$5000'), findsOneWidget);
      expect(find.text('Available'), findsOneWidget);
    });

    testWidgets('no muestra subtítulo cuando no se proporciona',
        (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: BudgetCard(
              title: 'Expense',
              amount: '\$2000',
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('Expense'), findsOneWidget);
      expect(find.text('\$2000'), findsOneWidget);
      expect(find.byType(Text).evaluate().length, equals(2)); // Solo título y monto
    });

    testWidgets('muestra indicador de progreso cuando se proporciona',
        (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: BudgetCard(
              title: 'Budget',
              amount: '\$3000',
              progress: 0.75,
            ),
          ),
        ),
      );

      // Assert
      expect(find.byType(LinearProgressIndicator), findsOneWidget);
      final progressIndicator = tester.widget<LinearProgressIndicator>(
        find.byType(LinearProgressIndicator),
      );
      expect(progressIndicator.value, equals(0.75));
    });

    testWidgets('no muestra indicador de progreso cuando no se proporciona',
        (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: BudgetCard(
              title: 'Income',
              amount: '\$1000',
            ),
          ),
        ),
      );

      // Assert
      expect(find.byType(LinearProgressIndicator), findsNothing);
    });

    testWidgets('tiene el diseño correcto con bordes redondeados y sombra',
        (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: BudgetCard(
              title: 'Test',
              amount: '\$100',
            ),
          ),
        ),
      );

      // Assert
      final container = tester.widget<Container>(
        find.byType(Container).first,
      );
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.borderRadius, isNotNull);
      expect(decoration.boxShadow, isNotNull);
      expect(decoration.boxShadow!.isNotEmpty, isTrue);
    });
  });
}

