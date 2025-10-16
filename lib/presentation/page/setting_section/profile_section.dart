import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:home_mock/core/localization/app_locale.dart';
import 'package:home_mock/core/utils/feedback.dart';

import '../../../core/constants/app_radius.dart';
import '../../../core/constants/app_spacing.dart';
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
      margin: AppSpacing.paddingHuge,
      padding: AppSpacing.paddingHuge,
      decoration: BoxDecoration(
        color: theme.bgLight,
        borderRadius: AppRadius.borderXxl,
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: CachedNetworkImageProvider(user.avatarUrl),
          ),
          AppSpacing.gapXxl,
          Text(
            user.name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: theme.text,
            ),
          ),
          AppSpacing.gapXs,
          Text(
            user.email,
            style: TextStyle(
              fontSize: 14,
              color: theme.textMuted,
            ),
          ),
          AppSpacing.gapXxl,
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
                borderRadius: AppRadius.borderLg,
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

              Future.delayed(const Duration(milliseconds: 100), () {
                if(context.mounted) {
                  final messenger = ScaffoldMessenger.of(context);
                  messenger.showSnackBar(
                    SnackBar(
                      content: Text(
                        context.l10n.loggedOutSuccessfully,
                        style: TextStyle(
                          color: theme.bgDark,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      duration: const Duration(seconds: 2),
                      backgroundColor: theme.primary,
                    ),
                  );
                }
              });
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
