import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/locator.dart';
import '../../state/settings/settings_bloc.dart';
import '../../state/settings/settings_event.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({required this.user});

  final dynamic user;

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.bgLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(user.avatarUrl),
          ),
          const SizedBox(height: 16),
          Text(
            user.name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: theme.text,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(
              fontSize: 14,
              color: theme.textMuted,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              _showLogoutDialog(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.bgDark,
              foregroundColor: theme.text,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: const Icon(Icons.logout, size: 18),
            label: const Text('Cerrar sesión'),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: theme.bgLight,
        title: Text(
          '¿Cerrar sesión?',
          style: TextStyle(color: theme.text),
        ),
        content: Text(
          'Se perderán los datos no guardados',
          style: TextStyle(color: theme.textMuted),
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text('Cancelar', style: TextStyle(color: theme.textMuted)),
          ),
          TextButton(
            onPressed: () {
              context.read<SettingsBloc>().add(SettingsLogout());
              context.pop();
              context.pop();
            },
            child: Text(
              'Cerrar sesión',
              style: TextStyle(color: theme.primary),
            ),
          ),
        ],
      ),
    );
  }
}
