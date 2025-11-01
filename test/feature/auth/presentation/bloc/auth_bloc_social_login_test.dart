import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ultimate_finance_app/common/services/hive_service.dart';
import 'package:ultimate_finance_app/feature/auth/data/services/auth_repository.dart';
import 'package:ultimate_finance_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:ultimate_finance_app/feature/auth/presentation/bloc/auth_event.dart';
import 'package:ultimate_finance_app/feature/auth/presentation/bloc/auth_state.dart';

// Mocks
class MockAuthRepository extends Mock implements AuthRepository {}

class MockHiveService extends Mock implements HiveService {}

class MockUser extends Mock implements User {}

class MockAuthCredential extends Mock implements AuthCredential {}

void main() {
  setUpAll(() {
    registerFallbackValue(MockAuthCredential());
  });
  group('AuthBloc - Social Login', () {
    late MockAuthRepository mockAuthRepository;
    late MockHiveService mockHiveService;
    late MockAuthCredential mockCredential;

    setUp(() {
      mockAuthRepository = MockAuthRepository();
      mockHiveService = MockHiveService();
      mockCredential = MockAuthCredential();

      // Setup default behavior for HiveService
      when(() => mockHiveService.getEmail()).thenReturn('');
      when(() => mockHiveService.getAuthenticated()).thenReturn(false);
      when(() => mockHiveService.saveEmail(any())).thenAnswer((_) async {});
      when(() => mockHiveService.setAuthenticated(any()))
          .thenAnswer((_) async {});
    });

    AuthBloc createBloc() {
      return AuthBloc(
        authRepository: mockAuthRepository,
        hiveService: mockHiveService,
      );
    }

    group('AuthGoogleLoginRequested', () {
      blocTest<AuthBloc, AuthState>(
        'emite [loading, success] cuando el login con Google es exitoso',
        build: () {
          final mockUser = MockUser();
          when(() => mockUser.email).thenReturn('user@google.com');
          when(
            () => mockAuthRepository.signInWithGoogle(credential: any(named: 'credential')),
          ).thenAnswer((_) async => mockUser);
          return createBloc();
        },
        act: (bloc) => bloc.add(
          AuthGoogleLoginRequested(credential: mockCredential),
        ),
        expect: () => [
          predicate<AuthState>(
            (state) =>
                state.isSubmitting == true && state.errorMessage == null,
          ),
          predicate<AuthState>(
            (state) =>
                state.isSubmitting == false &&
                state.isAuthenticated == true &&
                state.email == 'user@google.com',
          ),
        ],
        verify: (_) {
          verify(
            () => mockAuthRepository.signInWithGoogle(
              credential: mockCredential,
            ),
          ).called(1);
          verify(() => mockHiveService.saveEmail('user@google.com')).called(1);
          verify(() => mockHiveService.setAuthenticated(true)).called(1);
        },
      );

      blocTest<AuthBloc, AuthState>(
        'emite [loading, error] cuando el login con Google falla',
        build: () {
          when(
            () => mockAuthRepository.signInWithGoogle(
              credential: any(named: 'credential'),
            ),
          ).thenThrow('Authentication failed');
          return createBloc();
        },
        act: (bloc) => bloc.add(
          AuthGoogleLoginRequested(credential: mockCredential),
        ),
        expect: () => [
          predicate<AuthState>(
            (state) =>
                state.isSubmitting == true && state.errorMessage == null,
          ),
          predicate<AuthState>(
            (state) =>
                state.isSubmitting == false &&
                state.errorMessage == 'Authentication failed',
          ),
        ],
        verify: (_) {
          verify(
            () => mockAuthRepository.signInWithGoogle(
              credential: mockCredential,
            ),
          ).called(1);
          verifyNever(() => mockHiveService.saveEmail(any()));
          verifyNever(() => mockHiveService.setAuthenticated(true));
        },
      );

      blocTest<AuthBloc, AuthState>(
        'guarda email vacío cuando el usuario no tiene email',
        build: () {
          final mockUser = MockUser();
          when(() => mockUser.email).thenReturn(null);
          when(
            () => mockAuthRepository.signInWithGoogle(
              credential: any(named: 'credential'),
            ),
          ).thenAnswer((_) async => mockUser);
          return createBloc();
        },
        act: (bloc) => bloc.add(
          AuthGoogleLoginRequested(credential: mockCredential),
        ),
        verify: (_) {
          verify(() => mockHiveService.saveEmail('')).called(1);
        },
      );
    });

    group('AuthAppleLoginRequested', () {
      blocTest<AuthBloc, AuthState>(
        'emite [loading, success] cuando el login con Apple es exitoso',
        build: () {
          final mockUser = MockUser();
          when(() => mockUser.email).thenReturn('user@apple.com');
          when(
            () => mockAuthRepository.signInWithApple(
              credential: any(named: 'credential'),
            ),
          ).thenAnswer((_) async => mockUser);
          return createBloc();
        },
        act: (bloc) => bloc.add(
          AuthAppleLoginRequested(credential: mockCredential),
        ),
        expect: () => [
          predicate<AuthState>(
            (state) =>
                state.isSubmitting == true && state.errorMessage == null,
          ),
          predicate<AuthState>(
            (state) =>
                state.isSubmitting == false &&
                state.isAuthenticated == true &&
                state.email == 'user@apple.com',
          ),
        ],
        verify: (_) {
          verify(
            () => mockAuthRepository.signInWithApple(
              credential: mockCredential,
            ),
          ).called(1);
          verify(() => mockHiveService.saveEmail('user@apple.com')).called(1);
          verify(() => mockHiveService.setAuthenticated(true)).called(1);
        },
      );

      blocTest<AuthBloc, AuthState>(
        'emite [loading, error] cuando el login con Apple falla',
        build: () {
          when(
            () => mockAuthRepository.signInWithApple(
              credential: any(named: 'credential'),
            ),
          ).thenThrow('Invalid credential');
          return createBloc();
        },
        act: (bloc) => bloc.add(
          AuthAppleLoginRequested(credential: mockCredential),
        ),
        expect: () => [
          predicate<AuthState>(
            (state) =>
                state.isSubmitting == true && state.errorMessage == null,
          ),
          predicate<AuthState>(
            (state) =>
                state.isSubmitting == false &&
                state.errorMessage == 'Invalid credential',
          ),
        ],
        verify: (_) {
          verify(
            () => mockAuthRepository.signInWithApple(
              credential: mockCredential,
            ),
          ).called(1);
          verifyNever(() => mockHiveService.saveEmail(any()));
          verifyNever(() => mockHiveService.setAuthenticated(true));
        },
      );

      blocTest<AuthBloc, AuthState>(
        'guarda email vacío cuando el usuario no tiene email',
        build: () {
          final mockUser = MockUser();
          when(() => mockUser.email).thenReturn(null);
          when(
            () => mockAuthRepository.signInWithApple(
              credential: any(named: 'credential'),
            ),
          ).thenAnswer((_) async => mockUser);
          return createBloc();
        },
        act: (bloc) => bloc.add(
          AuthAppleLoginRequested(credential: mockCredential),
        ),
        verify: (_) {
          verify(() => mockHiveService.saveEmail('')).called(1);
        },
      );
    });

    group('Integración Social Login', () {
      blocTest<AuthBloc, AuthState>(
        'maneja correctamente múltiples intentos de login social',
        build: () {
          final mockGoogleUser = MockUser();
          final mockAppleUser = MockUser();
          when(() => mockGoogleUser.email).thenReturn('user@google.com');
          when(() => mockAppleUser.email).thenReturn('user@apple.com');
          when(
            () => mockAuthRepository.signInWithGoogle(
              credential: any(named: 'credential'),
            ),
          ).thenAnswer((_) async => mockGoogleUser);
          when(
            () => mockAuthRepository.signInWithApple(
              credential: any(named: 'credential'),
            ),
          ).thenAnswer((_) async => mockAppleUser);
          return createBloc();
        },
        act: (bloc) {
          bloc.add(AuthGoogleLoginRequested(credential: mockCredential));
          bloc.add(AuthAppleLoginRequested(credential: mockCredential));
        },
        expect: () => [
          // Google login states
          predicate<AuthState>(
            (state) => state.isSubmitting == true,
          ),
          predicate<AuthState>(
            (state) =>
                state.isAuthenticated == true &&
                state.email == 'user@google.com',
          ),
          // Apple login states
          predicate<AuthState>(
            (state) => state.isSubmitting == true,
          ),
          predicate<AuthState>(
            (state) =>
                state.isAuthenticated == true &&
                state.email == 'user@apple.com',
          ),
        ],
      );
    });
  });
}

