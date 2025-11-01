import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ultimate_finance_app/feature/income_deprecated/data/model/income_expense_model.dart';
import 'package:ultimate_finance_app/feature/income_deprecated/data/services/income_expense_repository.dart';

// Mocks
class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

// Para clases sealed de Firestore, necesitamos usar Mock/Fake para pruebas
// Esto es necesario para poder hacer pruebas unitarias con Firestore
// ignore: subtype_of_sealed_class
class MockCollectionReference extends Mock
    implements CollectionReference<Map<String, dynamic>> {}

// ignore: subtype_of_sealed_class
class FakeQuerySnapshot extends Fake
    implements QuerySnapshot<Map<String, dynamic>> {
  @override
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> docs;

  FakeQuerySnapshot(this.docs);
}

// ignore: subtype_of_sealed_class
class FakeQueryDocumentSnapshot extends Fake
    implements QueryDocumentSnapshot<Map<String, dynamic>> {
  @override
  final String id;
  final Map<String, dynamic> _data;

  FakeQueryDocumentSnapshot(this.id, Map<String, dynamic> data) : _data = data;

  @override
  Map<String, dynamic> data() => _data;

  @override
  dynamic operator [](Object? field) => _data[field];
}

// ignore: subtype_of_sealed_class
class FakeDocumentReference extends Mock
    implements DocumentReference<Map<String, dynamic>> {}

void main() {
  group('IncomeExpenseRepository', () {
    late MockFirebaseFirestore mockFirestore;
    late MockCollectionReference mockCollection;
    late IncomeExpenseRepository repository;

    setUp(() {
      mockFirestore = MockFirebaseFirestore();
      mockCollection = MockCollectionReference();
      repository = IncomeExpenseRepository(firestore: mockFirestore);

      when(() => mockFirestore.collection('transactions'))
          .thenReturn(mockCollection);
    });

    group('fetchTransactions', () {
      test('retorna lista de transacciones cuando la consulta es exitosa',
          () async {
        // Arrange
        final mockDoc1 = FakeQueryDocumentSnapshot(
          'doc1',
          {
            'amount': 1000,
            'description': 'Test income',
            'date': Timestamp.fromDate(DateTime(2024, 1, 1)),
            'type': 'income',
          },
        );

        final mockDoc2 = FakeQueryDocumentSnapshot(
          'doc2',
          {
            'amount': 500,
            'description': 'Test expense',
            'date': Timestamp.fromDate(DateTime(2024, 1, 2)),
            'type': 'expense',
          },
        );

        final mockSnapshot = FakeQuerySnapshot([mockDoc1, mockDoc2]);
        when(() => mockCollection.get())
            .thenAnswer((_) async => mockSnapshot);

        // Act
        final result = await repository.fetchTransactions();

        // Assert
        expect(result, isA<List<IncomeExpense>>());
        expect(result.length, equals(2));
        expect(result[0].id, equals('doc1'));
        expect(result[0].amount, equals(1000));
        expect(result[0].description, equals('Test income'));
        expect(result[0].type, equals('income'));
        expect(result[1].id, equals('doc2'));
        expect(result[1].amount, equals(500));
        expect(result[1].description, equals('Test expense'));
        expect(result[1].type, equals('expense'));

        verify(() => mockFirestore.collection('transactions')).called(1);
        verify(() => mockCollection.get()).called(1);
      });

      test('retorna lista vacía cuando no hay transacciones', () async {
        // Arrange
        final mockSnapshot = FakeQuerySnapshot([]);
        when(() => mockCollection.get())
            .thenAnswer((_) async => mockSnapshot);

        // Act
        final result = await repository.fetchTransactions();

        // Assert
        expect(result, isA<List<IncomeExpense>>());
        expect(result.isEmpty, isTrue);
      });

      test('lanza excepción cuando ocurre un error', () async {
        // Arrange
        when(() => mockCollection.get()).thenThrow(Exception('Network error'));

        // Act & Assert
        expect(
          () => repository.fetchTransactions(),
          throwsA(isA<Exception>()),
        );
        expect(
          () => repository.fetchTransactions(),
          throwsA(predicate<Exception>(
            (e) => e.toString().contains('Error fetching transaction'),
          )),
        );
      });
    });

    group('addTransaction', () {
      test('agrega transacción exitosamente', () async {
        // Arrange
        final transaction = IncomeExpense(
          amount: 1500,
          description: 'Salary',
          date: DateTime(2024, 1, 15),
          type: 'income',
        );

        final mockDocRef = FakeDocumentReference();
        when(() => mockCollection.add(any())).thenAnswer((_) async => mockDocRef);

        // Act
        await repository.addTransaction(transaction);

        // Assert
        verify(() => mockFirestore.collection('transactions')).called(1);
        verify(
          () => mockCollection.add({
            'amount': 1500,
            'description': 'Salary',
            'date': DateTime(2024, 1, 15),
            'type': 'income',
          }),
        ).called(1);
      });

      test('lanza excepción cuando ocurre un error al agregar', () async {
        // Arrange
        final transaction = IncomeExpense(
          amount: 1500,
          description: 'Salary',
          date: DateTime(2024, 1, 15),
          type: 'income',
        );

        when(() => mockCollection.add(any()))
            .thenThrow(Exception('Database error'));

        // Act & Assert
        expect(
          () => repository.addTransaction(transaction),
          throwsA(isA<Exception>()),
        );
        expect(
          () => repository.addTransaction(transaction),
          throwsA(predicate<Exception>(
            (e) => e.toString().contains('Error adding transactions'),
          )),
        );
      });
    });

    group('deleteTransaction', () {
      test('elimina transacción exitosamente', () async {
        // Arrange
        const docId = 'doc123';
        var deleteCalled = false;
        final mockDocRef = FakeDocumentReference();
        
        // Sobrescribimos el método delete para verificar que se llama
        when(() => mockDocRef.delete()).thenAnswer((_) async {
          deleteCalled = true;
        });

        when(() => mockFirestore.collection('transactions'))
            .thenReturn(mockCollection);
        when(() => mockCollection.doc(docId)).thenReturn(mockDocRef);

        // Act
        await repository.deleteTransaction(docId);

        // Assert
        verify(() => mockFirestore.collection('transactions')).called(1);
        verify(() => mockCollection.doc(docId)).called(1);
        expect(deleteCalled, isTrue);
      });
    });
  });
}

