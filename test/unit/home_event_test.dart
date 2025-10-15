import 'package:flutter_test/flutter_test.dart';
import 'package:home_mock/model/entity/item.dart';
import 'package:home_mock/presentation/state/home/home_event.dart';
import 'package:home_mock/presentation/state/home/home_state.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('HomesEvent', () {
    test('HomesLoadInitialData instances should be equal', () {
      final event1 = HomesLoadInitialData();
      final event2 = HomesLoadInitialData();
      expect(event1, isA<HomesLoadInitialData>());
      expect(event2, isA<HomesLoadInitialData>());
    });

    test('HomesChangeQuery should hold query value', () {
      final event = HomesChangeQuery('test query');
      expect(event.query, equals('test query'));
    });

    test('HomesChangeCategory should hold category value', () {
      final event = HomesChangeCategory(Category.apartment);
      expect(event.category, equals(Category.apartment));
    });

    test('HomesChangeFavorite should hold item value', () {
      final item = createTestItem();
      final event = HomesChangeFavorite(item);
      expect(event.item, equals(item));
    });

    test('HomesToggleTheme instances should be of correct type', () {
      final event = HomesToggleTheme();
      expect(event, isA<HomesToggleTheme>());
    });

    test('HomesToggleCityFilter should hold city value', () {
      final event = HomesToggleCityFilter('Test City');
      expect(event.city, equals('Test City'));
    });

    test('HomesChangePriceRange should hold min and max values', () {
      final event = HomesChangePriceRange(100, 500);
      expect(event.min, equals(100));
      expect(event.max, equals(500));
    });

    test('HomesChangeSortBy should hold sortBy value', () {
      final event = HomesChangeSortBy(SortBy.priceAsc);
      expect(event.sortBy, equals(SortBy.priceAsc));
    });

    test('HomesClearFilters instances should be of correct type', () {
      final event = HomesClearFilters();
      expect(event, isA<HomesClearFilters>());
    });

    test('HomesRetryLoad instances should be of correct type', () {
      final event = HomesRetryLoad();
      expect(event, isA<HomesRetryLoad>());
    });
  });
}
