import 'package:flutter_test/flutter_test.dart';
import 'package:home_mock/data/api/home_api.dart';
import 'package:home_mock/model/entity/item.dart';

void main() {
  group('HomeApiImpl End-to-End Tests', () {
    late HomeApiImpl homeApi;

    setUp(() {
      homeApi = HomeApiImpl();
    });

    test('should generate consistent data for same page', () async {
      final page1First = await homeApi.getHomes(page: 1);
      final page1Second = await homeApi.getHomes(page: 1);

      expect(page1First.length, equals(page1Second.length));
      expect(page1First.first.id, equals(page1Second.first.id));
      expect(page1First.first.title, equals(page1Second.first.title));
    });

    test('should generate different data for different pages', () async {
      final page1 = await homeApi.getHomes(page: 1);
      final page2 = await homeApi.getHomes(page: 2);

      expect(page1.first.id, isNot(equals(page2.first.id)));
      expect(page1.first.title, isNot(equals(page2.first.title)));
    });

    test('should return empty list for pages beyond max', () async {
      final result = await homeApi.getHomes(page: 10);

      expect(result, isEmpty);
    });

    test('should filter by query correctly', () async {
      final allItems = await homeApi.getHomes(page: 1);
      final filteredItems = await homeApi.getHomes(
        page: 1,
        query: 'BF Brockly',
      );

      expect(filteredItems.length, lessThanOrEqualTo(allItems.length));
      expect(
        filteredItems.every(
          (item) =>
              item.title.toLowerCase().contains('bf brockly') ||
              item.city.toLowerCase().contains('bf brockly'),
        ),
        isTrue,
      );
    });

    test('should filter by category correctly', () async {
      final apartmentItems = await homeApi.getHomes(
        page: 1,
        category: Category.apartment,
      );
      final houseItems = await homeApi.getHomes(
        page: 1,
        category: Category.house,
      );

      expect(
        apartmentItems.every((item) => item.category == Category.apartment),
        isTrue,
      );
      expect(
        houseItems.every((item) => item.category == Category.house),
        isTrue,
      );
    });

    test('should filter by both query and category', () async {
      final result = await homeApi.getHomes(
        page: 1,
        query: 'BF Brockly',
        category: Category.apartment,
      );

      expect(
        result.every(
          (item) =>
              item.category == Category.apartment &&
              (item.title.toLowerCase().contains('bf brockly') ||
                  item.city.toLowerCase().contains('bf brockly')),
        ),
        isTrue,
      );
    });

    test('should generate items with valid structure', () async {
      final items = await homeApi.getHomes(page: 1);

      for (final item in items) {
        expect(item.id, isNotEmpty);
        expect(item.title, isNotEmpty);
        expect(item.city, isNotEmpty);
        expect(item.imageUrl, isNotEmpty);
        expect(item.price, greaterThan(0));
        expect(item.description, isNotEmpty);
        expect(item.size, isNotEmpty);
        expect(item.bedrooms, greaterThan(0));
        expect(item.bathrooms, greaterThan(0));
        expect(item.owner.name, isNotEmpty);
        expect(item.owner.avatarUrl, isNotEmpty);
        expect(item.owner.city, isNotEmpty);
      }
    });

    test('should generate items with realistic price range', () async {
      final items = await homeApi.getHomes(page: 1);

      for (final item in items) {
        expect(item.price, greaterThanOrEqualTo(750));
        expect(item.price, lessThanOrEqualTo(1649));
      }
    });

    test('should generate items with realistic bedroom count', () async {
      final items = await homeApi.getHomes(page: 1);

      for (final item in items) {
        expect(item.bedrooms, greaterThanOrEqualTo(1));
        expect(item.bedrooms, lessThanOrEqualTo(4));
      }
    });

    test('should generate items with realistic bathroom count', () async {
      final items = await homeApi.getHomes(page: 1);

      for (final item in items) {
        expect(item.bathrooms, greaterThanOrEqualTo(1));
        expect(item.bathrooms, lessThanOrEqualTo(3));
      }
    });

    test('should generate items with realistic size range', () async {
      final items = await homeApi.getHomes(page: 1);

      for (final item in items) {
        final sizeValue = int.parse(item.size.split(' ')[0]);
        expect(sizeValue, greaterThanOrEqualTo(80));
        expect(sizeValue, lessThanOrEqualTo(199));
      }
    });

    test('should handle empty query gracefully', () async {
      final result = await homeApi.getHomes(page: 1, query: '');

      expect(result, isNotEmpty);
    });

    test('should handle null category gracefully', () async {
      final result = await homeApi.getHomes(page: 1, category: null);

      expect(result, isNotEmpty);
    });

    test('should handle all category correctly', () async {
      final result = await homeApi.getHomes(page: 1, category: Category.all);

      expect(result, isNotEmpty);
      expect(result.any((item) => item.category == Category.apartment), isTrue);
      expect(result.any((item) => item.category == Category.house), isTrue);
    });
  });
}
