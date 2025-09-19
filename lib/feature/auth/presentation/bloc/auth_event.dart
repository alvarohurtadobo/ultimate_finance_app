abstract class AuthEvent {}

class AuthEmailChanged extends AuthEvent {
  final String email;

  AuthEmailChanged(this.email);
}

class AuthPasswordChanged extends AuthEvent {
  final String password;

  AuthPasswordChanged(this.password);
}

class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;

  AuthLoginRequested({required this.email, required this.password});

  // @override
  // List<Object?> get props => [email, password];
}

class AuthLogoutRequested extends AuthEvent {}
