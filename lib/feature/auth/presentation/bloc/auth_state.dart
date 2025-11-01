import 'package:flutter/material.dart';

class AuthState {
  const AuthState({
    required this.email,
    required this.password,
    required this.isSubmitting,
    this.errorMessage,
    required this.isAuthenticated,
  });

  @override
  String toString() {
    return '$email: isSubmitting: $isSubmitting, errorMessage: $errorMessage, isAuthenticated: $isAuthenticated';
  }

  factory AuthState.recovered({
    required String hiveEmail,
    required bool hiveIsAuthenticated,
  }) {
    debugPrint("Recovered hive with email: $hiveEmail");
    return AuthState(
      email: hiveEmail,
      password: '',
      isSubmitting: false,
      errorMessage: null,
      isAuthenticated: hiveIsAuthenticated,
    );
  }

  factory AuthState.initial() {
    return AuthState(
      email: '',
      password: '',
      isSubmitting: false,
      errorMessage: null,
      isAuthenticated: false,
    );
  }

  AuthState copyWith({
    String? email,
    String? password,
    bool? isSubmitting,
    Object? errorMessage = _undefined,
    bool? isAuthenticated,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: errorMessage == _undefined 
          ? this.errorMessage 
          : errorMessage as String?,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
  
  static const _undefined = Object();

  final String email;
  final String password;
  final bool isSubmitting;
  final String? errorMessage;
  final bool isAuthenticated;
}
