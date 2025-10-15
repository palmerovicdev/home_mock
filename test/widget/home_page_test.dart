import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_mock/model/entity/item.dart';
import 'package:home_mock/presentation/page/home_page.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('HomePage', () {
    late MockHomesBloc mockHomesBloc;

    setUp(() {
      mockHomesBloc = MockHomesBloc();
    });

    testWidgets('should display header with user greeting', (tester) async {
      mockHomesBloc.setState(createTestHomesState());

      await tester.pumpWidget(
        createTestWidget(
          child: const HomePage(),
          homesBloc: mockHomesBloc,
        ),
      );

      expect(find.text('Hi, You'), findsOneWidget);
      expect(find.text('Buy Your'), findsOneWidget);
      expect(find.text('Perfect Home 🏠'), findsOneWidget);
    });

    testWidgets('should display search bar', (tester) async {
      mockHomesBloc.setState(createTestHomesState());

      await tester.pumpWidget(
        createTestWidget(
          child: const HomePage(),
          homesBloc: mockHomesBloc,
        ),
      );

      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('Find your next home'), findsOneWidget);
    });

    testWidgets('should display category filters', (tester) async {
      mockHomesBloc.setState(createTestHomesState());

      await tester.pumpWidget(
        createTestWidget(
          child: const HomePage(),
          homesBloc: mockHomesBloc,
        ),
      );

      expect(find.text('Apartment'), findsOneWidget);
      expect(find.text('House'), findsOneWidget);
      expect(find.text('All'), findsOneWidget);
    });

    testWidgets('should display loading indicator when loading', (
      tester,
    ) async {
      mockHomesBloc.setState(createTestHomesState(loading: true));

      await tester.pumpWidget(
        createTestWidget(
          child: const HomePage(),
          homesBloc: mockHomesBloc,
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should display items grid when items are loaded', (
      tester,
    ) async {
      final testItems = createTestItems(count: 4);
      mockHomesBloc.setState(createTestHomesState(items: testItems));

      await tester.pumpWidget(
        createTestWidget(
          child: const HomePage(),
          homesBloc: mockHomesBloc,
        ),
      );

      expect(find.byType(GridView), findsOneWidget);
    });

    testWidgets('should display no results message when no items', (
      tester,
    ) async {
      mockHomesBloc.setState(createTestHomesState(items: [], loading: false));

      await tester.pumpWidget(
        createTestWidget(
          child: const HomePage(),
          homesBloc: mockHomesBloc,
        ),
      );

      expect(find.text('No results'), findsOneWidget);
    });

    testWidgets('should display fetching more indicator when fetching more', (
      tester,
    ) async {
      mockHomesBloc.setState(createTestHomesState(fetchingMore: true));

      await tester.pumpWidget(
        createTestWidget(
          child: const HomePage(),
          homesBloc: mockHomesBloc,
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should display no more results message when no more items', (
      tester,
    ) async {
      mockHomesBloc.setState(
        createTestHomesState(
          hasMore: false,
          loading: false,
          fetchingMore: false,
        ),
      );

      await tester.pumpWidget(
        createTestWidget(
          child: const HomePage(),
          homesBloc: mockHomesBloc,
        ),
      );

      expect(find.text('No more results'), findsOneWidget);
    });

    testWidgets('should call search event when typing in search bar', (
      tester,
    ) async {
      mockHomesBloc.setState(createTestHomesState());

      await tester.pumpWidget(
        createTestWidget(
          child: const HomePage(),
          homesBloc: mockHomesBloc,
        ),
      );

      await tester.enterText(find.byType(TextField), 'test search');
      await tester.pump();

      // Verify that the search was triggered by checking if the query changed
      expect(mockHomesBloc.state.query, equals('test search'));
    });

    testWidgets('should call category change event when tapping category', (
      tester,
    ) async {
      mockHomesBloc.setState(createTestHomesState());

      await tester.pumpWidget(
        createTestWidget(
          child: const HomePage(),
          homesBloc: mockHomesBloc,
        ),
      );

      await tester.tap(find.text('Apartment'));
      await tester.pump();

      expect(mockHomesBloc.state.category, equals(Category.apartment));
    });

    testWidgets('should call theme toggle event when tapping theme button', (
      tester,
    ) async {
      mockHomesBloc.setState(createTestHomesState());

      await tester.pumpWidget(
        createTestWidget(
          child: const HomePage(),
          homesBloc: mockHomesBloc,
        ),
      );

      await tester.tap(find.byIcon(Icons.dark_mode));
      await tester.pump();

      expect(mockHomesBloc.state.isDarkMode, equals(false));
    });
  });
}
