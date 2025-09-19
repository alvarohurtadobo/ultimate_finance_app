import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultimate_finance_app/feature/auth/presentation/bloc/auth_event.dart';
import 'package:ultimate_finance_app/feature/auth/presentation/bloc/auth_state.dart';
import 'package:ultimate_finance_app/repositories/auth_repository.dart';
import 'package:ultimate_finance_app/services/hive_service.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.authRepository, required this.hiveService})
    : super(
        AuthState.recovered(
          hiveEmail: hiveService.getEmail() ?? '',
          hiveIsAuthenticated: hiveService.getAuthenticated(),
        ),
      ) {
    on<AuthEmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<AuthPasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<AuthLoginRequested>((event, emit) async {
      emit(state.copyWith(isSubmitting: true, errorMessage: null));
      try {
        debugPrint(
          'Attempt login for ${event.email} an password: ${event.password}',
        );
        final user = await authRepository.signInWithEmailAndPassword(
          event.email,
          event.password,
        );
        // If success then save to hive:
        hiveService.saveEmail(user?.email??'');
        hiveService.setAuthenticated(true);
        debugPrint('Attempt success login for ${user?.email}');
        emit(
          state.copyWith(
            email: user?.email,
            isSubmitting: false,
            isAuthenticated: true,
          ),
        );
      } catch (e) {
        debugPrint('Attempt failed login for ${e.toString()}');
        emit(state.copyWith(isSubmitting: false, errorMessage: e.toString()));
      }
    });

    on<AuthLogoutRequested>((event, emit) async {
      try {
        await authRepository.signOut();
        // await hiveService.clear();
        await hiveService.setAuthenticated(false);
        emit(
          state.copyWith(
            isAuthenticated: false,
            isSubmitting: false,
            errorMessage: null,
            email: '',
            password: ''
          ),
        );
      } catch (e) {
        await authRepository.signOut();
        emit(
          state.copyWith(
            isAuthenticated: false,
            isSubmitting: false,
            errorMessage: e.toString(),
          ),
        );
      }
    });
  }

  final AuthRepository authRepository;
  final HiveService hiveService;
}
