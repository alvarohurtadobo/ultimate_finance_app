import 'package:flutter_test/flutter_test.dart';
import 'package:ultimate_finance_app/feature/cash_flow/data/models/transaction.dart';

void main() {
  group('Transaction', () {
    test('crea instancia correctamente con todos los campos requeridos', () {
      // Arrange & Act
      final transaction = Transaction(
        id: 1,
        transactionGroupId: 101,
        amount: 150.75,
        issueDateTime: DateTime(2025, 1, 3, 14, 20),
        createdAt: DateTime(2025, 1, 3, 14, 25),
        updatedAt: DateTime(2025, 1, 3, 14, 25),
        deletedAt: null,
      );

      // Assert
      expect(transaction.id, equals(1));
      expect(transaction.transactionGroupId, equals(101));
      expect(transaction.amount, equals(150.75));
      expect(transaction.issueDateTime, equals(DateTime(2025, 1, 3, 14, 20)));
      expect(transaction.createdAt, equals(DateTime(2025, 1, 3, 14, 25)));
      expect(transaction.updatedAt, equals(DateTime(2025, 1, 3, 14, 25)));
      expect(transaction.deletedAt, isNull);
    });

    test('permite deletedAt ser null', () {
      // Arrange & Act
      final transaction = Transaction(
        id: 2,
        transactionGroupId: 102,
        amount: 200.0,
        issueDateTime: DateTime(2025, 1, 1),
        createdAt: DateTime(2025, 1, 1),
        updatedAt: DateTime(2025, 1, 1),
        deletedAt: null,
      );

      // Assert
      expect(transaction.deletedAt, isNull);
    });

    test('permite deletedAt tener un valor', () {
      // Arrange & Act
      final deletedAt = DateTime(2025, 1, 10);
      final transaction = Transaction(
        id: 3,
        transactionGroupId: 103,
        amount: 100.0,
        issueDateTime: DateTime(2025, 1, 1),
        createdAt: DateTime(2025, 1, 1),
        updatedAt: DateTime(2025, 1, 1),
        deletedAt: deletedAt,
      );

      // Assert
      expect(transaction.deletedAt, equals(deletedAt));
    });

    test('soporta diferentes tipos de montos', () {
      // Arrange & Act
      final transaction1 = Transaction(
        id: 4,
        transactionGroupId: 104,
        amount: 0.0,
        issueDateTime: DateTime(2025, 1, 1),
        createdAt: DateTime(2025, 1, 1),
        updatedAt: DateTime(2025, 1, 1),
        deletedAt: null,
      );

      final transaction2 = Transaction(
        id: 5,
        transactionGroupId: 105,
        amount: 999999.99,
        issueDateTime: DateTime(2025, 1, 1),
        createdAt: DateTime(2025, 1, 1),
        updatedAt: DateTime(2025, 1, 1),
        deletedAt: null,
      );

      final transaction3 = Transaction(
        id: 6,
        transactionGroupId: 106,
        amount: -50.25,
        issueDateTime: DateTime(2025, 1, 1),
        createdAt: DateTime(2025, 1, 1),
        updatedAt: DateTime(2025, 1, 1),
        deletedAt: null,
      );

      // Assert
      expect(transaction1.amount, equals(0.0));
      expect(transaction2.amount, equals(999999.99));
      expect(transaction3.amount, equals(-50.25));
    });

    test('puede tener diferentes transactionGroupId', () {
      // Arrange & Act
      final transactions = List.generate(
        5,
        (index) => Transaction(
          id: index,
          transactionGroupId: 100 + index,
          amount: 10.0 * (index + 1),
          issueDateTime: DateTime(2025, 1, 1),
          createdAt: DateTime(2025, 1, 1),
          updatedAt: DateTime(2025, 1, 1),
          deletedAt: null,
        ),
      );

      // Assert
      for (var i = 0; i < transactions.length; i++) {
        expect(transactions[i].transactionGroupId, equals(100 + i));
      }
    });
  });
}

