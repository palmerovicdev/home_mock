import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:home_mock/core/constants/app_radius.dart';
import 'package:home_mock/core/localization/app_locale.dart';

import '../../../core/locator.dart';
import '../../../core/utils/feedback.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.controller,
    required this.enabled,
  });

  final TextEditingController controller;
  final bool enabled;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscurePassword = true;

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
        controller: widget.controller,
        enabled: widget.enabled,
        obscureText: _obscurePassword,
        obscuringCharacter: '⌂',
        style: TextStyle(
          color: _obscurePassword ? theme.primary : theme.text,
          letterSpacing: _obscurePassword ? 2.0 : 0.0,
        ),
        cursorColor: theme.text,
        decoration: InputDecoration(
          labelText: context.l10n.password,
          hintText: context.l10n.enterPassword,
          prefixIcon: Icon(
            Icons.lock_outline,
            color: theme.primary,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _obscurePassword
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: _obscurePassword ? theme.primary : theme.textMuted,
            ),
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
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
          focusColor: theme.primary,
          hoverColor: theme.primary,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            error(null);
            return context.l10n.passwordRequired;
          }
          if (value.length < 6) {
            error(null);
            return context.l10n.passwordTooShort;
          }
          return null;
        },
      ),
    );
  }
}
