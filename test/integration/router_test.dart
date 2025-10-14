import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_mock/core/router/router.dart';
import 'package:home_mock/presentation/state/home/home_bloc.dart';
import 'package:home_mock/presentation/state/home/home_state.dart';
import 'package:home_mock/service/home_service.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('Router Integration Tests', () {
    late MockHomeService mockHomeService;

    setUp(() {
      mockHomeService = MockHomeService();
    });

    testWidgets('should navigate to home page by default', (tester) async {
      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: router,
        ),
      );

      expect(find.text('Hi, You'), findsOneWidget);
      expect(find.text('Buy Your'), findsOneWidget);
    });

    testWidgets('should navigate to details page with correct item', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: router,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byType(GestureDetector).first);
      await tester.pumpAndSettle();

      expect(find.text('Test Property 0'), findsOneWidget);
      expect(find.text('Test City 0'), findsOneWidget);
    });

    testWidgets('should navigate back to home page from details', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: router,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byType(GestureDetector).first);
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.arrow_back_ios_new_rounded));
      await tester.pumpAndSettle();

      expect(find.text('Hi, You'), findsOneWidget);
      expect(find.text('Buy Your'), findsOneWidget);
    });

    testWidgets('should handle invalid route gracefully', (tester) async {
      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: router,
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Hi, You'), findsOneWidget);
    });
  });
}
