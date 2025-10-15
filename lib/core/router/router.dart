import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_mock/core/router/router_observer.dart';
import 'package:home_mock/core/router/routes.dart';
import 'package:home_mock/presentation/page/home_page.dart';

import '../../presentation/page/details_page.dart';
import '../../presentation/page/settings_page.dart';

final rootNavigationKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: Routes.home.path,
  navigatorKey: rootNavigationKey,
  observers: [
    GoRouterObserver(),
  ],
  routes: [
    GoRoute(
      path: Routes.home.path,
      name: Routes.home.name,
      pageBuilder: (context, state) => MaterialPage(
        child: HomePage(),
      ),
    ),
    GoRoute(
      path: Routes.details.path,
      name: Routes.details.name,
      pageBuilder: (context, state) {
        final item = state.extra as String;
        return MaterialPage(child: DetailsPage(itemId: item));
      },
    ),
    GoRoute(
      path: Routes.settings.path,
      name: Routes.settings.name,
      pageBuilder: (context, state) => MaterialPage(
        child: SettingsPage(),
      ),
    ),
  ],
);
