import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_mock/presentation/page/details_page.dart';
import 'package:home_mock/presentation/state/home/home_bloc.dart';
import 'package:home_mock/presentation/state/home/home_state.dart';
import 'package:home_mock/service/home_service.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('DetailsPage', () {
    late MockHomesBloc mockHomesBloc;

    setUp(() {
      mockHomesBloc = MockHomesBloc();
    });

    testWidgets('should display property details', (tester) async {
      final testItem = createTestItem(
        id: 'test_id',
        title: 'Test Property',
        city: 'Test City',
        price: 1000,
        description: 'Test description',
        size: '100 m²',
        bedrooms: 2,
        bathrooms: 1,
      );

      mockHomesBloc.setState(createTestHomesState(items: [testItem]));

      await tester.pumpWidget(
        createTestWidget(
          child: DetailsPage(itemId: 'test_id'),
          homesBloc: mockHomesBloc,
        ),
      );

      expect(find.text('Test Property'), findsOneWidget);
      expect(find.text('Test City'), findsOneWidget);
      expect(find.text('\$1000/m'), findsOneWidget);
      expect(find.text('Test description'), findsOneWidget);
      expect(find.text('100'), findsOneWidget);
      expect(find.text('2'), findsOneWidget);
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('should display back button', (tester) async {
      final testItem = createTestItem(id: 'test_id');
      mockHomesBloc.setState(createTestHomesState(items: [testItem]));

      await tester.pumpWidget(
        createTestWidget(
          child: DetailsPage(itemId: 'test_id'),
          homesBloc: mockHomesBloc,
        ),
      );

      expect(find.byIcon(Icons.arrow_back_ios_new_rounded), findsOneWidget);
    });

    testWidgets('should display favorite button', (tester) async {
      final testItem = createTestItem(id: 'test_id', isFavorite: false);
      mockHomesBloc.setState(createTestHomesState(items: [testItem]));

      await tester.pumpWidget(
        createTestWidget(
          child: DetailsPage(itemId: 'test_id'),
          homesBloc: mockHomesBloc,
        ),
      );

      expect(find.byIcon(Icons.favorite_border), findsOneWidget);
    });

    testWidgets('should display filled favorite button when item is favorite', (
      tester,
    ) async {
      final testItem = createTestItem(id: 'test_id', isFavorite: true);
      mockHomesBloc.setState(createTestHomesState(items: [testItem]));

      await tester.pumpWidget(
        createTestWidget(
          child: DetailsPage(itemId: 'test_id'),
          homesBloc: mockHomesBloc,
        ),
      );

      expect(find.byIcon(Icons.favorite), findsOneWidget);
    });

    testWidgets('should display owner information', (tester) async {
      final testOwner = createTestOwner(
        name: 'John Doe',
        avatarUrl: 'https://example.com/avatar.jpg',
        city: 'New York',
      );
      final testItem = createTestItem(id: 'test_id', owner: testOwner);
      mockHomesBloc.setState(createTestHomesState(items: [testItem]));

      await tester.pumpWidget(
        createTestWidget(
          child: DetailsPage(itemId: 'test_id'),
          homesBloc: mockHomesBloc,
        ),
      );

      expect(find.text('John Doe'), findsOneWidget);
    });

    testWidgets('should display contact buttons', (tester) async {
      final testItem = createTestItem(id: 'test_id');
      mockHomesBloc.setState(createTestHomesState(items: [testItem]));

      await tester.pumpWidget(
        createTestWidget(
          child: DetailsPage(itemId: 'test_id'),
          homesBloc: mockHomesBloc,
        ),
      );

      expect(find.byIcon(Icons.chat_bubble_outline), findsOneWidget);
      expect(find.byIcon(Icons.call_outlined), findsOneWidget);
    });

    testWidgets('should display buy now button', (tester) async {
      final testItem = createTestItem(id: 'test_id');
      mockHomesBloc.setState(createTestHomesState(items: [testItem]));

      await tester.pumpWidget(
        createTestWidget(
          child: DetailsPage(itemId: 'test_id'),
          homesBloc: mockHomesBloc,
        ),
      );

      expect(find.text('Buy Now'), findsOneWidget);
    });

    testWidgets('should display feature cards', (tester) async {
      final testItem = createTestItem(
        id: 'test_id',
        size: '120 m²',
        bedrooms: 3,
        bathrooms: 2,
      );
      mockHomesBloc.setState(createTestHomesState(items: [testItem]));

      await tester.pumpWidget(
        createTestWidget(
          child: DetailsPage(itemId: 'test_id'),
          homesBloc: mockHomesBloc,
        ),
      );

      expect(find.text('120'), findsOneWidget);
      expect(find.text('3'), findsOneWidget);
      expect(find.text('2'), findsOneWidget);
      expect(find.text('Bedrooms'), findsOneWidget);
      expect(find.text('Bathrooms'), findsOneWidget);
    });

    testWidgets(
      'should call favorite change event when tapping favorite button',
      (tester) async {
        final testItem = createTestItem(id: 'test_id', isFavorite: false);
        mockHomesBloc.setState(createTestHomesState(items: [testItem]));

        await tester.pumpWidget(
          createTestWidget(
            child: DetailsPage(itemId: 'test_id'),
            homesBloc: mockHomesBloc,
          ),
        );

        await tester.tap(find.byIcon(Icons.favorite_border));
        await tester.pump();

        // Verify that the favorite was toggled
        expect(mockHomesBloc.state.version, equals(1));
      },
    );

    testWidgets('should display description section', (tester) async {
      final testItem = createTestItem(
        id: 'test_id',
        description: 'This is a test description for the property.',
      );
      mockHomesBloc.setState(createTestHomesState(items: [testItem]));

      await tester.pumpWidget(
        createTestWidget(
          child: DetailsPage(itemId: 'test_id'),
          homesBloc: mockHomesBloc,
        ),
      );

      expect(find.text('Description'), findsOneWidget);
      expect(
        find.text('This is a test description for the property.'),
        findsOneWidget,
      );
    });

    testWidgets('should display price in bottom sheet', (tester) async {
      final testItem = createTestItem(id: 'test_id', price: 1500);
      mockHomesBloc.setState(createTestHomesState(items: [testItem]));

      await tester.pumpWidget(
        createTestWidget(
          child: DetailsPage(itemId: 'test_id'),
          homesBloc: mockHomesBloc,
        ),
      );

      expect(find.text('Price'), findsOneWidget);
      expect(find.text('\$1500/m'), findsOneWidget);
    });
  });
}
