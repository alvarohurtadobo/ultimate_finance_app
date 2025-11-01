import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ultimate_finance_app/feature/auth/data/services/auth_repository.dart';

// Mocks
class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUserCredential extends Mock implements UserCredential {}

class MockUser extends Mock implements User {}

class MockAuthCredential extends Mock implements AuthCredential {}

void main() {
  group('AuthRepository - Social Login', () {
    late MockFirebaseAuth mockFirebaseAuth;
    late AuthRepository authRepository;
    late MockAuthCredential mockCredential;

    setUp(() {
      mockFirebaseAuth = MockFirebaseAuth();
      authRepository = AuthRepository(firebaseAuth: mockFirebaseAuth);
      mockCredential = MockAuthCredential();
    });

    group('signInWithGoogle', () {
      test('retorna User cuando el login es exitoso', () async {
        // Arrange
        final mockUser = MockUser();
        final mockUserCredential = MockUserCredential();

        when(() => mockUser.email).thenReturn('test@google.com');
        when(() => mockUserCredential.user).thenReturn(mockUser);
        when(
          () => mockFirebaseAuth.signInWithCredential(mockCredential),
        ).thenAnswer((_) async => mockUserCredential);

        // Act
        final result = await authRepository.signInWithGoogle(
          credential: mockCredential,
        );

        // Assert
        expect(result, equals(mockUser));
        verify(() => mockFirebaseAuth.signInWithCredential(mockCredential))
            .called(1);
      });

      test('lanza excepción con mensaje cuando FirebaseAuthException ocurre',
          () async {
        // Arrange
        when(
          () => mockFirebaseAuth.signInWithCredential(mockCredential),
        ).thenThrow(
          FirebaseAuthException(code: 'user-disabled', message: 'User disabled'),
        );

        // Act & Assert
        expect(
          () => authRepository.signInWithGoogle(credential: mockCredential),
          throwsA('User disabled'),
        );
      });

      test('lanza "Unknown error" cuando FirebaseAuthException no tiene mensaje',
          () async {
        // Arrange
        when(
          () => mockFirebaseAuth.signInWithCredential(mockCredential),
        ).thenThrow(FirebaseAuthException(code: 'unknown-error'));

        // Act & Assert
        expect(
          () => authRepository.signInWithGoogle(credential: mockCredential),
          throwsA('Unknown error'),
        );
      });

      test('lanza error genérico cuando ocurre otra excepción', () async {
        // Arrange
        when(
          () => mockFirebaseAuth.signInWithCredential(mockCredential),
        ).thenThrow(Exception('Network error'));

        // Act & Assert
        expect(
          () => authRepository.signInWithGoogle(credential: mockCredential),
          throwsA(predicate<String>((error) => error.contains('Generic error'))),
        );
      });
    });

    group('signInWithApple', () {
      test('retorna User cuando el login es exitoso', () async {
        // Arrange
        final mockUser = MockUser();
        final mockUserCredential = MockUserCredential();

        when(() => mockUser.email).thenReturn('test@apple.com');
        when(() => mockUserCredential.user).thenReturn(mockUser);
        when(
          () => mockFirebaseAuth.signInWithCredential(mockCredential),
        ).thenAnswer((_) async => mockUserCredential);

        // Act
        final result = await authRepository.signInWithApple(
          credential: mockCredential,
        );

        // Assert
        expect(result, equals(mockUser));
        verify(() => mockFirebaseAuth.signInWithCredential(mockCredential))
            .called(1);
      });

      test('lanza excepción con mensaje cuando FirebaseAuthException ocurre',
          () async {
        // Arrange
        when(
          () => mockFirebaseAuth.signInWithCredential(mockCredential),
        ).thenThrow(
          FirebaseAuthException(
            code: 'invalid-credential',
            message: 'Invalid credential',
          ),
        );

        // Act & Assert
        expect(
          () => authRepository.signInWithApple(credential: mockCredential),
          throwsA('Invalid credential'),
        );
      });

      test('lanza "Unknown error" cuando FirebaseAuthException no tiene mensaje',
          () async {
        // Arrange
        when(
          () => mockFirebaseAuth.signInWithCredential(mockCredential),
        ).thenThrow(FirebaseAuthException(code: 'unknown-error'));

        // Act & Assert
        expect(
          () => authRepository.signInWithApple(credential: mockCredential),
          throwsA('Unknown error'),
        );
      });

      test('lanza error genérico cuando ocurre otra excepción', () async {
        // Arrange
        when(
          () => mockFirebaseAuth.signInWithCredential(mockCredential),
        ).thenThrow(Exception('Network error'));

        // Act & Assert
        expect(
          () => authRepository.signInWithApple(credential: mockCredential),
          throwsA(predicate<String>((error) => error.contains('Generic error'))),
        );
      });
    });
  });
}

