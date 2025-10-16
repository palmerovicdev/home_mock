import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_mock/core/constants/app_radius.dart';

import '../../core/constants/app_spacing.dart';
import '../../core/localization/app_locale.dart';
import '../../core/locator.dart';
import '../../core/utils/feedback.dart';
import '../state/auth/auth_bloc.dart';
import '../state/auth/auth_event.dart';
import '../state/auth/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthBloc>().add(
        AuthLogin(_emailController.text.trim(), _passwordController.text),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.bgDark,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.hasError && state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(context.l10n.invalidCredentials),
                backgroundColor: theme.danger,
              ),
            );
            context.read<AuthBloc>().add(AuthClearError());
          }
        },
        builder: (context, state) {
          final isLoading = state.isChecking;

          return SafeArea(
            child: SingleChildScrollView(
              padding: AppSpacing.paddingExtraLarge,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
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

                    TextFormField(
                      controller: _emailController,
                      enabled: !isLoading,
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
                        if (!value.contains('@')) {
                          error(null);
                          return context.l10n.emailInvalid;
                        }
                        return null;
                      },
                    ),

                    AppSpacing.gapHuge,

                    TextFormField(
                      controller: _passwordController,
                      enabled: !isLoading,
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
                            _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
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

                    AppSpacing.gapGiant,

                    SizedBox(
                      height: 56,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : () => _handleLogin(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.primary,
                          disabledBackgroundColor: theme.primary.withValues(
                            alpha: 0.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: AppRadius.borderXxl,
                          ),
                          elevation: 0,
                        ),
                        child: isLoading
                            ? SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation(
                                    theme.text,
                                  ),
                                ),
                              )
                            : Text(
                                context.l10n.login,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: theme.text,
                                ),
                              ),
                      ),
                    ),

                    if (isLoading) ...[
                      AppSpacing.gapHuge,
                      Center(
                        child: Text(
                          context.l10n.loggingIn,
                          style: TextStyle(
                            color: theme.textMuted,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],

                    AppSpacing.gapGiant,

                    Container(
                      padding: AppSpacing.paddingXxl,
                      decoration: BoxDecoration(
                        color: theme.bgLight,
                        borderRadius: AppRadius.borderXxl,
                        border: Border.all(color: theme.border),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                size: 20,
                                color: theme.primary,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Demo Credentials',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: theme.text,
                                ),
                              ),
                            ],
                          ),
                          AppSpacing.gapMd,
                          Text(
                            'Email: cualquier email con @\nPassword: 6+ caracteres',
                            style: TextStyle(
                              fontSize: 13,
                              color: theme.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
