import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_mock/core/locator.dart';
import 'package:home_mock/model/entity/settings.dart';
import 'package:home_mock/presentation/state/home/home_bloc.dart';
import 'package:home_mock/presentation/state/home/home_event.dart';
import 'package:home_mock/presentation/state/settings/settings_bloc.dart';
import 'package:home_mock/presentation/state/settings/settings_event.dart';
import 'package:home_mock/presentation/state/settings/settings_state.dart';

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
          create: (context) => HomesBloc(homeService)..add(HomesLoadInitialData()),
        ),
        BlocProvider(
          create: (context) => SettingsBloc()..add(SettingsLoadPreferences()),
        ),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        buildWhen: (p, c) => p.themeMode != c.themeMode,
        builder: (context, settingsState) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            themeMode: _getThemeMode(settingsState.themeMode),
            darkTheme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(seedColor: theme.bgDark),
            ),
            routerConfig: router,
          );
        },
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
