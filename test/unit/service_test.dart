import 'package:flutter_test/flutter_test.dart';
import 'package:home_mock/data/api/home_api.dart';
import 'package:home_mock/data/repository/home_repository.dart';
import 'package:home_mock/model/entity/item.dart';
import 'package:home_mock/service/home_service.dart';

void main() {
  group('HomeApiImpl', () {
    late HomeApiImpl homeApi;

    setUp(() {
      homeApi = HomeApiImpl();
    });

    test('should return items for first page', () async {
      final result = await homeApi.getHomes(page: 1);

      expect(result, isA<List<Item>>());
      expect(result.length, equals(8));
      expect(result.first.id, equals('home_1'));
    });

    test('should return empty list for page beyond max pages', () async {
      final result = await homeApi.getHomes(page: 10);

      expect(result, isEmpty);
    });

    test('should filter items by query', () async {
      final result = await homeApi.getHomes(page: 1, query: 'BF Brockly');

      expect(result, isNotEmpty);
      expect(result.every((item) => item.title.contains('BF Brockly')), isTrue);
    });

    test('should filter items by category', () async {
      final result = await homeApi.getHomes(
        page: 1,
        category: Category.apartment,
      );

      expect(result, isNotEmpty);
      expect(
        result.every((item) => item.category == Category.apartment),
        isTrue,
      );
    });

    test('should filter items by both query and category', () async {
      final result = await homeApi.getHomes(
        page: 1,
        query: 'BF Brockly',
        category: Category.apartment,
      );

      expect(result, isNotEmpty);
      expect(
        result.every(
          (item) =>
              item.title.contains('BF Brockly') &&
              item.category == Category.apartment,
        ),
        isTrue,
      );
    });

    test('should return different items for different pages', () async {
      final page1 = await homeApi.getHomes(page: 1);
      final page2 = await homeApi.getHomes(page: 2);

      expect(page1.first.id, isNot(equals(page2.first.id)));
    });

    test('should have consistent data for same page', () async {
      final page1First = await homeApi.getHomes(page: 1);
      final page1Second = await homeApi.getHomes(page: 1);

      expect(page1First.length, equals(page1Second.length));
      expect(page1First.first.id, equals(page1Second.first.id));
    });
  });

  group('HomeRepositoryImpl', () {
    late HomeRepositoryImpl repository;
    late HomeApiImpl api;

    setUp(() {
      api = HomeApiImpl();
      repository = HomeRepositoryImpl(api);
    });

    test('should return items from api', () async {
      final result = await repository.fetch(page: 1);

      expect(result, isA<List<Item>>());
      expect(result.length, equals(8));
    });

    test('should pass parameters to api correctly', () async {
      final result = await repository.fetch(
        page: 2,
        query: 'test',
        category: Category.apartment,
      );

      expect(result, isA<List<Item>>());
    });
  });

  group('HomeServiceImpl', () {
    late HomeServiceImpl service;
    late HomeRepositoryImpl repository;

    setUp(() {
      repository = HomeRepositoryImpl(HomeApiImpl());
      service = HomeServiceImpl(repository);
    });

    test('should return items from repository', () async {
      final result = await service.fetchHomes(page: 1);

      expect(result, isA<List<Item>>());
      expect(result.length, equals(8));
    });

    test('should pass parameters to repository correctly', () async {
      final result = await service.fetchHomes(
        page: 2,
        query: 'test',
        category: Category.apartment,
      );

      expect(result, isA<List<Item>>());
    });
  });
}
