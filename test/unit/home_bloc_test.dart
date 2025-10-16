import 'package:flutter_test/flutter_test.dart';
import 'package:home_mock/model/entity/item.dart';
import 'package:home_mock/presentation/state/home/home_bloc.dart';
import 'package:home_mock/presentation/state/home/home_event.dart';
import 'package:home_mock/presentation/state/home/home_state.dart';
import 'package:home_mock/service/home_service.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('HomesBloc', () {
    late HomesBloc homesBloc;
    late MockHomeService mockHomeService;

    setUp(() {
      mockHomeService = MockHomeService();
      homesBloc = HomesBloc(mockHomeService);
    });

    tearDown(() {
      homesBloc.close();
    });

    test('initial state should be correct', () {
      expect(homesBloc.state, equals(const HomesState()));
    });

    test(
      'should load all data initially and set initialLoadComplete to true',
      () async {
        homesBloc.add(HomesLoadInitialData());

        await Future.delayed(const Duration(milliseconds: 100));

        expect(homesBloc.state.allItems.length, equals(10));
        expect(homesBloc.state.items.length, equals(10));
        expect(homesBloc.state.loading, equals(false));
        expect(homesBloc.state.initialLoadComplete, equals(true));
        expect(homesBloc.state.availableCities.isNotEmpty, equals(true));
      },
    );

    test('should emit loading state then error state on failure', () async {
      final failingService = FailingHomeService();
      final failingBloc = HomesBloc(failingService);

      failingBloc.add(HomesLoadInitialData());

      await Future.delayed(const Duration(milliseconds: 100));

      expect(failingBloc.state.error, isNotNull);
      expect(failingBloc.state.loading, equals(false));

      failingBloc.close();
    });

    test('should update query and filter items locally', () async {
      homesBloc.add(HomesLoadInitialData());
      await Future.delayed(const Duration(milliseconds: 100));

      homesBloc.add(HomesChangeQuery('test query'));
      await Future.delayed(const Duration(milliseconds: 400));

      expect(homesBloc.state.query, equals('test query'));
      expect(homesBloc.state.loading, equals(false));
    });

    test('should update category and filter items locally', () async {
      homesBloc.add(HomesLoadInitialData());
      await Future.delayed(const Duration(milliseconds: 100));

      homesBloc.add(HomesChangeCategory(Category.apartment));
      await Future.delayed(const Duration(milliseconds: 500));

      expect(homesBloc.state.category, equals(Category.apartment));
      expect(homesBloc.state.loading, equals(false));
    });

    test('should toggle city filter and update filtered items', () async {
      homesBloc.add(HomesLoadInitialData());
      await Future.delayed(const Duration(milliseconds: 100));

      final cityToFilter = homesBloc.state.availableCities.first;
      homesBloc.add(HomesToggleCityFilter(cityToFilter));
      await Future.delayed(const Duration(milliseconds: 300));

      expect(homesBloc.state.selectedCities, contains(cityToFilter));
      expect(homesBloc.state.loading, equals(false));
    });

    test('should change price range and filter items', () async {
      homesBloc.add(HomesLoadInitialData());
      await Future.delayed(const Duration(milliseconds: 100));

      homesBloc.add(HomesChangePriceRange(1000, 1500));
      await Future.delayed(const Duration(milliseconds: 300));

      expect(homesBloc.state.minPriceFilter, equals(1000));
      expect(homesBloc.state.maxPriceFilter, equals(1500));
      expect(homesBloc.state.loading, equals(false));
    });

    test('should change sort by and reorder items', () async {
      homesBloc.add(HomesLoadInitialData());
      await Future.delayed(const Duration(milliseconds: 100));

      homesBloc.add(HomesChangeSortBy(SortBy.priceAsc));
      await Future.delayed(const Duration(milliseconds: 300));

      expect(homesBloc.state.sortBy, equals(SortBy.priceAsc));
      expect(homesBloc.state.loading, equals(false));
    });

    test('should clear all filters', () async {
      homesBloc.add(HomesLoadInitialData());
      await Future.delayed(const Duration(milliseconds: 100));

      // Apply some filters
      homesBloc.add(HomesChangeQuery('test'));
      await Future.delayed(const Duration(milliseconds: 400));

      homesBloc.add(HomesClearFilters());
      await Future.delayed(const Duration(milliseconds: 300));

      expect(homesBloc.state.query, equals(''));
      expect(homesBloc.state.selectedCities, isEmpty);
      expect(homesBloc.state.sortBy, isNull);
    });

    test('should update favorite status of specific item', () async {
      homesBloc.add(HomesLoadInitialData());
      await Future.delayed(const Duration(milliseconds: 100));

      final item = homesBloc.state.items.first;
      final updatedItem = item.copyWith(isFavorite: !item.isFavorite);

      homesBloc.add(HomesChangeFavorite(updatedItem));
      await Future.delayed(const Duration(milliseconds: 100));

      expect(
        homesBloc.state.allItems.firstWhere((i) => i.id == item.id).isFavorite,
        equals(updatedItem.isFavorite),
      );
    });

    test('hasActiveFilters should work correctly', () async {
      homesBloc.add(HomesLoadInitialData());
      await Future.delayed(const Duration(milliseconds: 100));

      expect(homesBloc.state.hasActiveFilters, equals(false));

      homesBloc.add(HomesChangeQuery('test'));
      await Future.delayed(const Duration(milliseconds: 400));

      expect(homesBloc.state.hasActiveFilters, equals(true));
    });
  });
}

class FailingHomeService implements HomeService {
  @override
  Future<List<Item>> fetchAllHomes() async {
    throw Exception('Test error');
  }
}
