import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:home_mock/core/localization/app_locale.dart';
import 'package:home_mock/core/utils/feedback.dart';

import '../../../core/locator.dart';
import '../../state/auth/auth_bloc.dart';
import '../../state/auth/auth_event.dart';
import '../../state/settings/settings_bloc.dart';
import '../../state/settings/settings_event.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key, required this.user});

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
            backgroundImage: CachedNetworkImageProvider(user.avatarUrl),
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
          TextButton.icon(
            onPressed: click(() {
              _showLogoutDialog(context);
            }),
            style: TextButton.styleFrom(
              backgroundColor: theme.primary,
              foregroundColor: theme.text,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: Icon(
              Icons.logout,
              size: 18,
              color: theme.sText,
            ),
            label: Text(
              context.l10n.logout,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: theme.sText,
              ),
            ),
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
          context.l10n.logoutConfirmTitle,
          style: TextStyle(color: theme.text),
        ),
        content: Text(
          context.l10n.logoutConfirmMessage,
          style: TextStyle(color: theme.textMuted),
        ),
        actions: [
          TextButton(
            onPressed: click(() {
              context.pop();
            }),
            style: TextButton.styleFrom(
              overlayColor: theme.primary,
            ),
            child: Text(
              context.l10n.cancel,
              style: TextStyle(color: theme.textMuted),
            ),
          ),
          TextButton(
            onPressed: select(() {
              context.read<AuthBloc>().add(AuthLogout());

              context.read<SettingsBloc>().add(SettingsLogout());
              context.pop();
            }),
            style: TextButton.styleFrom(
              overlayColor: theme.primary,
            ),
            child: Text(
              context.l10n.logout,
              style: TextStyle(color: theme.primary),
            ),
          ),
        ],
      ),
    );
  }
}
