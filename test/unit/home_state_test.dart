import 'package:flutter_test/flutter_test.dart';
import 'package:home_mock/model/entity/item.dart';
import 'package:home_mock/presentation/state/home/home_state.dart';

void main() {
  group('HomesState', () {
    test('should be equal when all properties are the same', () {
      final state1 = HomesState(
        items: [],
        loading: false,
        query: 'test',
        initialLoadComplete: true,
      );
      final state2 = HomesState(
        items: [],
        loading: false,
        query: 'test',
        initialLoadComplete: true,
      );

      expect(state1, equals(state2));
    });

    test('should not be equal when properties differ', () {
      final state1 = HomesState(query: 'test1');
      final state2 = HomesState(query: 'test2');

      expect(state1, isNot(equals(state2)));
    });

    test('copyWith should create new instance with updated properties', () {
      final originalState = HomesState(
        items: [],
        loading: false,
        query: 'original',
        initialLoadComplete: false,
      );

      final updatedState = originalState.copyWith(
        query: 'updated',
        initialLoadComplete: true,
        loading: true,
      );

      expect(updatedState.query, equals('updated'));
      expect(updatedState.initialLoadComplete, equals(true));
      expect(updatedState.loading, equals(true));
      expect(updatedState.items, equals([]));
    });

    test('copyWith should preserve original values when not specified', () {
      final originalState = HomesState(
        items: [],
        loading: false,
        query: 'original',
        initialLoadComplete: false,
        isDarkMode: true,
      );

      final updatedState = originalState.copyWith(query: 'updated');

      expect(updatedState.query, equals('updated'));
      expect(updatedState.loading, equals(false));
      expect(updatedState.initialLoadComplete, equals(false));
      expect(updatedState.isDarkMode, equals(true));
    });

    test('hasActiveFilters should return true when filters are active', () {
      final state = HomesState(
        query: 'test',
        selectedCities: ['Test City'],
        absoluteMinPrice: 0,
        absoluteMaxPrice: 10000,
        minPriceFilter: 0,
        maxPriceFilter: 5000,
      );

      expect(state.hasActiveFilters, equals(true));
    });

    test('hasActiveFilters should return false when no filters are active', () {
      const state = HomesState(
        query: '',
        selectedCities: [],
        absoluteMinPrice: 0,
        absoluteMaxPrice: 10000,
        minPriceFilter: 0,
        maxPriceFilter: 10000,
      );

      expect(state.hasActiveFilters, equals(false));
    });

    test('props should include all properties', () {
      final state = HomesState(
        allItems: [],
        items: [],
        loading: true,
        initialLoadComplete: true,
        query: 'test',
        category: Category.apartment,
        error: 'error',
        version: 2,
        isDarkMode: false,
        selectedCities: ['City1'],
        availableCities: ['City1', 'City2'],
        minPriceFilter: 100,
        maxPriceFilter: 900,
        absoluteMinPrice: 0,
        absoluteMaxPrice: 1000,
        sortBy: SortBy.priceAsc,
      );

      expect(state.props.length, equals(16));
    });
  });
}
