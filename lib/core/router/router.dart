import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_mock/core/router/router_observer.dart';
import 'package:home_mock/core/router/routes.dart';
import 'package:home_mock/model/entity/auth_status.dart';
import 'package:home_mock/presentation/page/home_page.dart';
import 'package:home_mock/presentation/page/login_page.dart';
import 'package:home_mock/presentation/page/splash_page.dart';

import '../../presentation/page/details_page.dart';
import '../../presentation/page/settings_page.dart';

final rootNavigationKey = GlobalKey<NavigatorState>();

final authStateNotifier = ValueNotifier<AuthStatus>(AuthStatus.initial);

GoRouter createRouter() {
  return GoRouter(
    initialLocation: Routes.splash.path,
    navigatorKey: rootNavigationKey,
    refreshListenable: authStateNotifier,
    observers: [
      GoRouterObserver(),
    ],
    redirect: (context, state) {
      final authStatus = authStateNotifier.value;
      final isSplash = state.matchedLocation == Routes.splash.path;
      final isLogin = state.matchedLocation == Routes.login.path;
      final isAuthenticated = authStatus == AuthStatus.authenticated;
      final isChecking = authStatus == AuthStatus.checking || authStatus == AuthStatus.initial;

      if (isChecking && !isSplash) {
        return Routes.splash.path;
      }

      if (isSplash && !isChecking) {
        return isAuthenticated ? Routes.home.path : Routes.login.path;
      }

      if (!isAuthenticated && !isLogin && !isSplash && !isChecking) {
        return Routes.login.path;
      }

      if (isAuthenticated && isLogin) {
        return Routes.home.path;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: Routes.splash.path,
        name: Routes.splash.name,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const SplashPage(),
        ),
      ),
      GoRoute(
        path: Routes.login.path,
        name: Routes.login.name,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const LoginPage(),
        ),
      ),
      GoRoute(
        path: Routes.home.path,
        name: Routes.home.name,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: HomePage(),
        ),
      ),
      GoRoute(
        path: Routes.details.path,
        name: Routes.details.name,
        pageBuilder: (context, state) {
          final item = state.extra as String;
          return MaterialPage(
            key: state.pageKey,
            child: DetailsPage(itemId: item),
          );
        },
      ),
      GoRoute(
        path: Routes.settings.path,
        name: Routes.settings.name,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: SettingsPage(),
        ),
      ),
    ],
  );
}

final router = createRouter();
