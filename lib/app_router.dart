import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ultimate_finance_app/screens/dashboard_screen.dart';
import 'package:ultimate_finance_app/screens/login_screen.dart';
import 'package:ultimate_finance_app/screens/profile_screen.dart';
import 'package:ultimate_finance_app/screens/spending_screen.dart';
import 'package:ultimate_finance_app/screens/wallet_screen.dart';
import 'package:ultimate_finance_app/widgets/nav_bar.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      final user = FirebaseAuth.instance.currentUser;

      final isLoginView = state.uri.toString() == '/login';

      if (user == null) {
        return isLoginView ? null : '/login';
      }

      if (isLoginView) return '/dashboard';

      // In any other case do nothing:
      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
      ShellRoute(
        builder: (context, state, child) {
          final user = FirebaseAuth.instance.currentUser;
          if (user == null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.go('/login');
            });
          }
          return Scaffold(
            body: child,
            bottomNavigationBar: NavBar(
              currentIndex: _getCurrentIndex(state.uri.toString()),
              onTabSelected: (index) {
                switch (index) {
                  case 0:
                    context.go('/dashboard');
                    break;
                  case 1:
                    context.pushNamed('/spending');
                    break;
                  case 2:
                    context.pushNamed('/wallet');
                    break;
                  case 3:
                    context.pushNamed('/profile');
                    break;
                  case 4:
                    context.pushNamed('/notifications');
                    break;
                }
              },
            ),
          );
        },
        routes: [
          GoRoute(
            path: '/dashboard',
            builder: (context, state) {
              return const DashboardScreen();
            },
          ),
          GoRoute(
            path: '/spending',
            builder: (context, state) {
              return const SpendingScreen();
            },
          ),
          GoRoute(
            path: '/wallet',
            builder: (context, state) {
              return const WalletScreen();
            },
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) {
              return const ProfileScreen();
            },
          ),
        ],
      ),
    ],
  );

  static int _getCurrentIndex(String? location) {
    switch (location) {
      case '/login':
        return 0;
      case '/dashboard':
        return 1;
      case '/spending':
        return 2;
      case '/wallet':
        return 3;
      case '/profile':
        return 5;
      default:
        return 5;
    }
  }
}
