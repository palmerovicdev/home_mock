import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_mock/core/locator.dart';
import 'package:home_mock/presentation/state/home/home_bloc.dart';
import 'package:home_mock/presentation/state/home/home_event.dart';
import 'package:home_mock/presentation/state/home/home_state.dart';

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
    return BlocProvider(
      create: (context) =>
      HomesBloc(homeService)
        ..add(
     HomesLoadInitialData()),
   
           child: BlocBuilder<HomesBloc, HomesState>(
        buildWhen: (p, c) => p.version != c.version,
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            themeMode:state.isDarkMode? ThemeMode.dark : ThemeMode.light,
            darkTheme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(seedColor: theme.bgDark)
            ),
            routerConfig: router,
          );
        },
      ),
    );
  }
}