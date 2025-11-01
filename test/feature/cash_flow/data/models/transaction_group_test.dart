import 'package:flutter_test/flutter_test.dart';
import 'package:ultimate_finance_app/feature/cash_flow/data/models/transaction_group_model.dart';

void main() {
  group('TransactionGroup', () {
    test('crea instancia correctamente con todos los campos requeridos', () {
      // Arrange & Act
      final group = TransactionGroup(
        id: 1,
        type: 'income',
        name: 'Salario',
      );

      // Assert
      expect(group.id, equals(1));
      expect(group.type, equals('income'));
      expect(group.name, equals('Salario'));
    });

    test('soporta diferentes tipos de transacciones', () {
      // Arrange & Act
      final income = TransactionGroup(
        id: 1,
        type: 'income',
        name: 'Ingresos',
      );
      final expense = TransactionGroup(
        id: 2,
        type: 'expense',
        name: 'Gastos',
      );
      final incomeDebt = TransactionGroup(
        id: 3,
        type: 'income_debt',
        name: 'Pago de deudas',
      );
      final loan = TransactionGroup(
        id: 4,
        type: 'loan',
        name: 'Préstamos',
      );

      // Assert
      expect(income.type, equals('income'));
      expect(expense.type, equals('expense'));
      expect(incomeDebt.type, equals('income_debt'));
      expect(loan.type, equals('loan'));
    });

    test('puede tener nombres con caracteres especiales', () {
      // Arrange & Act
      final group1 = TransactionGroup(
        id: 1,
        type: 'expense',
        name: 'Alimentación',
      );
      final group2 = TransactionGroup(
        id: 2,
        type: 'expense',
        name: 'Esparcimiento',
      );

      // Assert
      expect(group1.name, equals('Alimentación'));
      expect(group2.name, equals('Esparcimiento'));
    });

    test('los datos de ejemplo están correctamente estructurados', () {
      // Arrange & Act - usando los datos de ejemplo del modelo
      final incomeGroups = myIncomeTransactionGroups;
      final expenseGroups = myExpensesTransactionGroups;

      // Assert
      expect(incomeGroups.isNotEmpty, isTrue);
      expect(expenseGroups.isNotEmpty, isTrue);

      for (final group in incomeGroups) {
        expect(group.id, isA<int>());
        expect(group.type, isA<String>());
        expect(group.name, isA<String>());
        expect(['income', 'income_debt'].contains(group.type), isTrue);
      }

      for (final group in expenseGroups) {
        expect(group.id, isA<int>());
        expect(group.type, equals('expense'));
        expect(group.name, isA<String>());
      }
    });
  });
}

