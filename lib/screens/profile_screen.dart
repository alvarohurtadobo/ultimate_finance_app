import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ultimate_finance_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:ultimate_finance_app/feature/auth/presentation/bloc/auth_event.dart';
import 'package:ultimate_finance_app/widgets/profile_option.dart';
import '../widgets/profile_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: theme.appBarTheme.foregroundColor,
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ProfileCard(name: '', email: user?.email ?? '', avatarUrl: null),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  const ProfileOption(
                    icon: Icons.security,
                    title: 'Security Settings',
                  ),
                  const ProfileOption(
                    icon: Icons.notifications,
                    title: 'Notifications',
                  ),
                  const ProfileOption(
                    icon: Icons.help_outline,
                    title: 'Help & Support',
                  ),
                  ProfileOption(
                    icon: Icons.logout,
                    title: 'Logout',
                    onTap: () {
                      _showLogoutConfirmationDialog(context).then((confimed) {
                        if (confimed == true) {
                          context.read<AuthBloc>().add(AuthLogoutRequested());
                          context.go('/login');
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _showLogoutConfirmationDialog(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Confirm Logout'),
            content: const Text('Are you sure you want to log out?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Logout'),
              ),
            ],
          ),
        ) ??
        false;
  }
}
