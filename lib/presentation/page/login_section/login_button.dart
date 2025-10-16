import 'package:flutter/material.dart';
import 'package:flutter_motionly/widget/button/animated_state_button.dart';
import 'package:home_mock/core/localization/app_locale.dart';

import '../../../core/locator.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.onPressed,
    required this.controller,
  });

  final VoidCallback onPressed;
  final AnimatedStateButtonController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedStateButton(
      controller: controller,
      initColor: theme.primary,
      borderRadius: 12,
      compactSize: 56,
      width: 56,
      height: 56,
      onPressed: () async => onPressed.call(),
      initChild: Text(
        context.l10n.login,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: theme.sText,
        ),
      ),
    );
  }
}
