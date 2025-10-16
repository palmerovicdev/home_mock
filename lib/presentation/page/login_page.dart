import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_motionly/widget/button/animated_state_button.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_spacing.dart';
import '../../core/localization/app_locale.dart';
import '../../core/locator.dart';
import '../state/auth/auth_bloc.dart';
import '../state/auth/auth_event.dart';
import '../state/auth/auth_state.dart';
import 'login_section/demo_credentials_card.dart';
import 'login_section/email_field.dart';
import 'login_section/login_header.dart';
import 'login_section/password_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _hasShownRedirectMessage = false;
  final AnimatedStateButtonController _loginButtonController = AnimatedStateButtonController(
    states: {
      'success': ButtonState.success(color: theme.success),
      'loading': ButtonState.loading(color: theme.primary),
      'error': ButtonState.error(color: theme.primary),
    },
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkRedirect();
    });
  }

  void _checkRedirect() {
    final uri = GoRouterState.of(context).uri;
    final isRedirect = uri.queryParameters['redirect'] == 'true';

    if (isRedirect && !_hasShownRedirectMessage) {
      _hasShownRedirectMessage = true;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.l10n.loginRequired),
          backgroundColor: theme.warning,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String _getErrorMessage(String? errorMessage, BuildContext context) {
    if (errorMessage == null) return context.l10n.authenticationFailed;

    switch (errorMessage) {
      case 'INVALID_CREDENTIALS':
        return context.l10n.invalidCredentials;
      case 'SERVER_ERROR':
        return context.l10n.serverError;
      case 'NETWORK_ERROR':
        return context.l10n.networkError;
      case 'UNEXPECTED_ERROR':
        return context.l10n.unexpectedError;
      default:
        return context.l10n.authenticationFailed;
    }
  }

  void _handleLogin(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      _loginButtonController.changeState('loading');
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
        listenWhen: (previous, current) {
          return (current.hasError && current.errorMessage != null && previous.errorMessage != current.errorMessage) || (current.isAuthenticated && !previous.isAuthenticated);
        },
        buildWhen: (previous, current) {
          return previous.isChecking != current.isChecking;
        },
        listener: (context, state) {
          if (state.isAuthenticated) {
            _loginButtonController.changeState('success');
            return;
          }

          if (state.hasError && state.errorMessage != null) {
            _loginButtonController.changeState('error');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  _getErrorMessage(state.errorMessage, context),
                  style: TextStyle(
                    color: theme.sText,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                backgroundColor: theme.primary,
                duration: const Duration(seconds: 2),
              ),
            );
            _loginButtonController.changeState('init');
            context.read<AuthBloc>().add(AuthClearError());
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: AppSpacing.paddingExtraLarge,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const LoginHeader(),
                    EmailField(
                      controller: _emailController,
                      enabled: !state.isChecking,
                    ),
                    AppSpacing.gapHuge,
                    PasswordField(
                      controller: _passwordController,
                      enabled: !state.isChecking,
                    ),
                    AppSpacing.gapHuge,
                    Center(
                      child: AnimatedStateButton(
                        controller: _loginButtonController,
                        initColor: theme.primary,
                        borderRadius: 12,
                        compactSize: 56,
                        height: 56,
                        onPressed: () async => _handleLogin(context),
                        initChild: Text(
                          context.l10n.login,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: theme.sText,
                          ),
                        ),
                      ),
                    ),
                    AppSpacing.gapHuge,
                    const DemoCredentialsCard(),
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
