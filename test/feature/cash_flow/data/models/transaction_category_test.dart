import 'package:flutter_test/flutter_test.dart';
import 'package:ultimate_finance_app/feature/cash_flow/data/models/transaction_category_model.dart';

void main() {
  group('TransactionCategory', () {
    test('crea instancia correctamente con todos los campos requeridos', () {
      // Arrange & Act
      final category = TransactionCategory(
        id: 1,
        type: 'income',
        name: 'Salario',
        groupId: 1,
      );

      // Assert
      expect(category.id, equals(1));
      expect(category.type, equals('income'));
      expect(category.name, equals('Salario'));
      expect(category.groupId, equals(1));
    });

    test('soporta tipos income y expense', () {
      // Arrange & Act
      final incomeCategory = TransactionCategory(
        id: 1,
        type: 'income',
        name: 'Consultoría',
        groupId: 1,
      );
      final expenseCategory = TransactionCategory(
        id: 2,
        type: 'expense',
        name: 'Almuerzo',
        groupId: 13,
      );

      // Assert
      expect(incomeCategory.type, equals('income'));
      expect(expenseCategory.type, equals('expense'));
    });

    test('puede tener múltiples categorías con el mismo groupId', () {
      // Arrange & Act
      final category1 = TransactionCategory(
        id: 11,
        type: 'expense',
        name: 'Desayuno',
        groupId: 13,
      );
      final category2 = TransactionCategory(
        id: 12,
        type: 'expense',
        name: 'Almuerzo',
        groupId: 13,
      );
      final category3 = TransactionCategory(
        id: 13,
        type: 'expense',
        name: 'Cena',
        groupId: 13,
      );

      // Assert
      expect(category1.groupId, equals(13));
      expect(category2.groupId, equals(13));
      expect(category3.groupId, equals(13));
      expect(category1.id, isNot(equals(category2.id)));
      expect(category2.id, isNot(equals(category3.id)));
    });

    test('los datos de ejemplo están correctamente estructurados', () {
      // Arrange & Act - usando los datos de ejemplo del modelo
      final categories = myTransactions;

      // Assert
      expect(categories.isNotEmpty, isTrue);

      for (final category in categories) {
        expect(category.id, isA<int>());
        expect(category.type, isA<String>());
        expect(['income', 'expense'].contains(category.type), isTrue);
        expect(category.name, isA<String>());
        expect(category.name.isNotEmpty, isTrue);
        expect(category.groupId, isA<int>());
      }
    });

    test('categorías de income tienen groupId correspondiente', () {
      // Arrange & Act
      final incomeCategories = myTransactions.where(
        (c) => c.type == 'income',
      );

      // Assert
      expect(incomeCategories.isNotEmpty, isTrue);
      for (final category in incomeCategories) {
        expect(category.type, equals('income'));
        expect(category.groupId, isA<int>());
      }
    });

    test('categorías de expense tienen groupId correspondiente', () {
      // Arrange & Act
      final expenseCategories = myTransactions.where(
        (c) => c.type == 'expense',
      );

      // Assert
      expect(expenseCategories.isNotEmpty, isTrue);
      for (final category in expenseCategories) {
        expect(category.type, equals('expense'));
        expect(category.groupId, isA<int>());
      }
    });
  });
}

