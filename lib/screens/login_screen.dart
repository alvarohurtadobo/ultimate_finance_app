import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ultimate_finance_app/blocs/auth/auth_bloc.dart';
import 'package:ultimate_finance_app/blocs/auth/auth_event.dart';
import 'package:ultimate_finance_app/blocs/auth/auth_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inicio')),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (BuildContext context, AuthState state) {
          print("Listen to state: $state");
          if (state.isAuthenticated) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Bienvenido, ${state.email}')),
            );
            context.go('/dashboard');
            // Future.delayed(const Duration(seconds: 2), () {
            // });
          } else {
            if (state.isSubmitting) {
              // showDialog(
              //   context: context,
              //   builder: (cotext) =>
              //       const Center(child: CircularProgressIndicator()),
              // );
              setState(() {
                isLoading = true;
              });
            } else {
              Future.delayed(const Duration(seconds: 2), () {
                setState(() {
                  isLoading = false;
                });
              });
            }
            if (state.isAuthenticated) {
              // Navigator.of(context).pop();
              context.go('/dashboard');
            } else if (state.errorMessage != null) {
              // Navigator.of(context).pop();
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
            }
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LoginForm(isLoading: isLoading),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({required this.isLoading, super.key});
  final bool isLoading;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    _emailController.text = 'a.hurtado.bo@gmail.com';
    _emailController.text = 'alvarohurtado@hotmail';
    final authState = context.read<AuthBloc>().state;
    if (authState.email.isNotEmpty) {
      _emailController.text = authState.email;
    }
    _passwordController.text = 'Canuto7000';
    _passwordController.text = '123456';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmailField(controller: _emailController),
          const SizedBox(height: 16),
          PasswordField(controller: _passwordController),
          const SizedBox(height: 24),
          ElevatedButton(
            // style: ButtonStyle(hei),
            onPressed: _signIn,
            child: widget.isLoading
                ? CircularProgressIndicator(color: Colors.white)
                : Text('Iniciar sesion'),
          ),
        ],
      ),
    );
  }

  Future<void> _signIn() async {
    if (_formKey.currentState?.validate() == true) {
      try {
        print(
          "About to send: ${_emailController.text}, ${_passwordController.text}",
        );
        context.read<AuthBloc>().add(
          AuthLoginRequested(
            email: _emailController.text,
            password: _passwordController.text,
          ),
        );
        // UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        //   email: _emailController.text,
        //   password: _passwordController.text,
        // ); // Bad practice
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text('Bienvenido, ${userCredential.user?.email}')),
        // );
        // Future.delayed(const Duration(seconds: 2), () {
        //       context.go('/dashboard');
        //     });
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error ${e.message}')));
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

class EmailField extends StatelessWidget {
  final TextEditingController controller;
  const EmailField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'Correo',
        prefixIcon: Icon(Icons.email),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: Validator.validateEmail,
    );
  }
}

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  const PasswordField({super.key, required this.controller});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: 'Contraseña',
        prefixIcon: Icon(Icons.lock),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              isObscured = !isObscured;
            });
          },
          child: Icon(
            isObscured ? Icons.remove_red_eye : Icons.remove_red_eye_outlined,
          ),
        ),
      ),
      obscureText: isObscured,
      keyboardType: TextInputType.emailAddress,
      validator: Validator.validatePassword,
    );
  }
}

class Validator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese el correo';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Por favor, ingres un correo valido';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese su contrsena';
    }
    if (value.length < 6) {
      return 'la contrasena tiene al menos 6 caracteres';
    }
    return null;
  }
}
