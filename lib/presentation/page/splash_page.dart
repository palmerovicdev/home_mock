import 'package:flutter/material.dart';

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
                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                child: Icon(
                  Icons.home_rounded,
                  size: 80,
                  color: theme.primary,
                ),
              ),
            ),

            const SizedBox(height: 40),

            Text(
              context.l10n.appTitle,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: theme.text,
              ),
            ),

            const SizedBox(height: 60),

            SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                strokeWidth: 4,
                valueColor: AlwaysStoppedAnimation(theme.primary),
              ),
            ),

            const SizedBox(height: 20),

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
