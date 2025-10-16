import 'package:flutter/material.dart';
import 'package:home_mock/core/constants/app_radius.dart';
import 'package:home_mock/core/localization/app_locale.dart';

import '../../../core/locator.dart';
import '../../../core/utils/feedback.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    required this.controller,
    required this.enabled,
  });

  final TextEditingController controller;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: theme.primary,
          selectionColor: theme.primary.withOpacity(0.1),
          selectionHandleColor: theme.primary,
        ),
      ),
      child: TextFormField(
        controller: controller,
        enabled: enabled,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(color: theme.text),
        cursorColor: theme.text,
        decoration: InputDecoration(
          labelText: context.l10n.email,
          hintText: context.l10n.enterEmail,
          prefixIcon: Icon(
            Icons.email_outlined,
            color: theme.primary,
          ),
          filled: true,
          fillColor: theme.bgLight,
          border: OutlineInputBorder(
            borderRadius: AppRadius.borderXxl,
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: AppRadius.borderXxl,
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: AppRadius.borderXxl,
            borderSide: BorderSide(
              color: theme.primary,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: AppRadius.borderXxl,
            borderSide: BorderSide(color: theme.danger, width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: AppRadius.borderXxl,
            borderSide: BorderSide(color: theme.danger, width: 2),
          ),
          labelStyle: TextStyle(color: theme.textMuted),
          hintStyle: TextStyle(color: theme.textMuted),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            error(null);
            return context.l10n.emailRequired;
          }
          final emailRegex = RegExp(
            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
          );
          if (!emailRegex.hasMatch(value.trim())) {
            error(null);
            return context.l10n.emailInvalid;
          }
          return null;
        },
      ),
    );
  }
}
