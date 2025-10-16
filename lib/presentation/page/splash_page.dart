import 'package:flutter/material.dart';
import 'package:home_mock/core/constants/app_radius.dart';
import 'package:home_mock/core/constants/app_spacing.dart';

import '../../core/localization/app_locale.dart';
import '../../core/locator.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.bgDark,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: theme.bgLight,
                borderRadius: AppRadius.borderExtraLarge,
              ),
              child: Center(
                child: Icon(
                  Icons.home_rounded,
                  size: 80,
                  color: theme.primary,
                ),
              ),
            ),

            AppSpacing.gapGiant,

            Text(
              context.l10n.appTitle,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: theme.text,
              ),
            ),

            AppSpacing.gapHuge,

            SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                strokeWidth: 6,
                valueColor: AlwaysStoppedAnimation(theme.primary),
              ),
            ),

            AppSpacing.gapHuge,
            AppSpacing.gapHuge,

            Text(
              context.l10n.checkingAuth,
              style: TextStyle(
                fontSize: 18,
                color: theme.textMuted,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
