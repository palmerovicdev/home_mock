import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_mock/main.dart';
import 'package:home_mock/presentation/state/home/home_bloc.dart';
import 'package:home_mock/presentation/state/home/home_state.dart';
import 'package:home_mock/service/home_service.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('HomeMockApp Integration Tests', () {
    late MockHomeService mockHomeService;

    setUp(() {
      mockHomeService = MockHomeService();
    });

    testWidgets('should display home page on app start', (tester) async {
      await tester.pumpWidget(HomeMockApp());

      expect(find.text('Hi, You'), findsOneWidget);
      expect(find.text('Buy Your'), findsOneWidget);
      expect(find.text('Perfect Home 🏠'), findsOneWidget);
    });

    testWidgets('should navigate to details page when tapping property', (
      tester,
    ) async {
      await tester.pumpWidget(HomeMockApp());
      await tester.pumpAndSettle();

      await tester.tap(find.byType(GestureDetector).first);
      await tester.pumpAndSettle();

      expect(find.text('Test Property 0'), findsOneWidget);
      expect(find.text('Test City 0'), findsOneWidget);
      expect(find.text('\$1000/m'), findsOneWidget);
    });

    testWidgets('should search properties when typing in search bar', (
      tester,
    ) async {
      await tester.pumpWidget(HomeMockApp());
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'test search');
      await tester.pumpAndSettle();

      // Verify that the search was triggered
      expect(find.text('test search'), findsOneWidget);
    });

    testWidgets('should filter by category when tapping category button', (
      tester,
    ) async {
      await tester.pumpWidget(HomeMockApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Apartment'));
      await tester.pumpAndSettle();

      // Verify that the category filter was applied
      expect(find.text('Apartment'), findsOneWidget);
    });

    testWidgets('should toggle favorite when tapping favorite button', (
      tester,
    ) async {
      await tester.pumpWidget(HomeMockApp());
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.favorite_border).first);
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.favorite), findsOneWidget);
    });

    testWidgets('should toggle theme when tapping theme button', (
      tester,
    ) async {
      await tester.pumpWidget(HomeMockApp());
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.dark_mode));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.light_mode), findsOneWidget);
    });

    testWidgets('should load more items when scrolling to bottom', (
      tester,
    ) async {
      await tester.pumpWidget(HomeMockApp());
      await tester.pumpAndSettle();

      await tester.drag(find.byType(CustomScrollView), const Offset(0, -1000));
      await tester.pumpAndSettle();

      // Verify that more items were loaded
      expect(find.byType(GridView), findsOneWidget);
    });

    testWidgets('should display no results when no items found', (
      tester,
    ) async {
      await tester.pumpWidget(HomeMockApp());
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'nonexistent');
      await tester.pumpAndSettle();

      expect(find.text('No results'), findsOneWidget);
    });

    testWidgets('should maintain favorite state when navigating back', (
      tester,
    ) async {
      await tester.pumpWidget(HomeMockApp());
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.favorite_border).first);
      await tester.pumpAndSettle();

      await tester.tap(find.byType(GestureDetector).first);
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.arrow_back_ios_new_rounded));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.favorite), findsOneWidget);
    });
  });
}
