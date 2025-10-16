import 'package:flutter/material.dart';
import 'package:home_mock/core/constants/app_radius.dart';
import 'package:home_mock/core/localization/app_locale.dart';

import '../../../core/constants/app_spacing.dart';
import '../../../core/locator.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSpacing.gapGiant,
        Center(
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: theme.bgLight,
              borderRadius: AppRadius.borderRounded,
            ),
            child: Center(
              child: Icon(
                Icons.home_rounded,
                size: 60,
                color: theme.primary,
              ),
            ),
          ),
        ),
        AppSpacing.gapGiant,
        Text(
          context.l10n.welcomeBack,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: theme.text,
          ),
          textAlign: TextAlign.center,
        ),
        AppSpacing.gapMd,
        Text(
          context.l10n.signInToContinue,
          style: TextStyle(
            fontSize: 16,
            color: theme.textMuted,
          ),
          textAlign: TextAlign.center,
        ),
        AppSpacing.gapGiant,
      ],
    );
  }
}
