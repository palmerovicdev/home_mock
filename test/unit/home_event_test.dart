import 'package:flutter_test/flutter_test.dart';
import 'package:home_mock/presentation/state/home/home_event.dart';
import 'package:home_mock/model/entity/item.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('HomesEvent', () {
    test('HomesFetchFirst should be equal to another HomesFetchFirst', () {
      final event1 = HomesFetchFirst();
      final event2 = HomesFetchFirst();

      expect(event1, equals(event2));
    });

    test('HomesFetchMore should be equal to another HomesFetchMore', () {
      final event1 = HomesFetchMore();
      final event2 = HomesFetchMore();

      expect(event1, equals(event2));
    });

    test('HomesChangeFavorite should be equal when items are equal', () {
      final item1 = createTestItem(id: 'test_id');
      final item2 = createTestItem(id: 'test_id');

      final event1 = HomesChangeFavorite(item1);
      final event2 = HomesChangeFavorite(item2);

      expect(event1, equals(event2));
    });

    test(
      'HomesChangeFavorite should not be equal when items are different',
      () {
        final item1 = createTestItem(id: 'test_id_1');
        final item2 = createTestItem(id: 'test_id_2');

        final event1 = HomesChangeFavorite(item1);
        final event2 = HomesChangeFavorite(item2);

        expect(event1, isNot(equals(event2)));
      },
    );

    test('HomesChangeQuery should be equal when queries are equal', () {
      final event1 = HomesChangeQuery('test query');
      final event2 = HomesChangeQuery('test query');

      expect(event1, equals(event2));
    });

    test('HomesChangeQuery should not be equal when queries are different', () {
      final event1 = HomesChangeQuery('test query 1');
      final event2 = HomesChangeQuery('test query 2');

      expect(event1, isNot(equals(event2)));
    });

    test('HomesChangeCategory should be equal when categories are equal', () {
      final event1 = HomesChangeCategory(Category.apartment);
      final event2 = HomesChangeCategory(Category.apartment);

      expect(event1, equals(event2));
    });

    test(
      'HomesChangeCategory should not be equal when categories are different',
      () {
        final event1 = HomesChangeCategory(Category.apartment);
        final event2 = HomesChangeCategory(Category.house);

        expect(event1, isNot(equals(event2)));
      },
    );

    test('HomesChangeCategory should be equal when both are null', () {
      final event1 = HomesChangeCategory(null);
      final event2 = HomesChangeCategory(null);

      expect(event1, equals(event2));
    });

    test('HomesChangeCategory should not be equal when one is null', () {
      final event1 = HomesChangeCategory(null);
      final event2 = HomesChangeCategory(Category.apartment);

      expect(event1, isNot(equals(event2)));
    });

    test('HomesToggleTheme should be equal to another HomesToggleTheme', () {
      final event1 = HomesToggleTheme();
      final event2 = HomesToggleTheme();

      expect(event1, equals(event2));
    });

    test('HomesChangeFavorite should have correct item property', () {
      final item = createTestItem(id: 'test_id');
      final event = HomesChangeFavorite(item);

      expect(event.item, equals(item));
    });

    test('HomesChangeQuery should have correct query property', () {
      const query = 'test query';
      final event = HomesChangeQuery(query);

      expect(event.query, equals(query));
    });

    test('HomesChangeCategory should have correct category property', () {
      final category = Category.apartment;
      final event = HomesChangeCategory(category);

      expect(event.category, equals(category));
    });

    test('HomesChangeCategory should handle null category', () {
      final event = HomesChangeCategory(null);

      expect(event.category, isNull);
    });
  });
}
