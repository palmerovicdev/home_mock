import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:home_mock/core/locator.dart';
import 'package:home_mock/l10n/app_localizations.dart';
import 'package:home_mock/model/entity/settings.dart';
import 'package:home_mock/presentation/state/auth/auth_bloc.dart';
import 'package:home_mock/presentation/state/auth/auth_event.dart';
import 'package:home_mock/presentation/state/auth/auth_state.dart' as auth;
import 'package:home_mock/presentation/state/home/home_bloc.dart';
import 'package:home_mock/presentation/state/home/home_event.dart';
import 'package:home_mock/presentation/state/settings/settings_bloc.dart';
import 'package:home_mock/presentation/state/settings/settings_event.dart';
import 'package:home_mock/presentation/state/settings/settings_state.dart';

import 'core/router/router.dart' as app_router;
import 'core/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpLocator();
  runApp(const HomeMockApp());
}

class HomeMockApp extends StatelessWidget {
  const HomeMockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(authService)..add(AuthCheckSession()),
        ),
        BlocProvider(
          create: (context) => HomesBloc(homeService)..add(HomesLoadInitialData()),
        ),
        BlocProvider(
          create: (context) => SettingsBloc()..add(SettingsLoadPreferences()),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, auth.AuthState>(
            listener: (context, state) {
              app_router.authStateNotifier.value = state.status;
            },
          ),
        ],
        child: BlocBuilder<SettingsBloc, SettingsState>(
          buildWhen: (p, c) => p.themeMode != c.themeMode || p.language != c.language,
          builder: (context, settingsState) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              themeMode: _getThemeMode(settingsState.themeMode),
              theme: ThemeData(
                useMaterial3: true,
                appBarTheme: const AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle.light,
                ),
              ),
              darkTheme: ThemeData(
                useMaterial3: true,
                appBarTheme: const AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle.light,
                ),
              ),
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('es', ''),
                Locale('en', ''),
              ],
              locale: Locale(settingsState.language.code, ''),
              routerConfig: router,
            );
          },
        ),
      ),
    );
  }

  ThemeMode _getThemeMode(AppThemeMode themeMode) {
    switch (themeMode) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
        return ThemeMode.system;
    }
  }
}
