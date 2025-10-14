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
        page: 1,
      );
      final state2 = HomesState(
        items: [],
        loading: false,
        query: 'test',
        page: 1,
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
        page: 0,
      );

      final updatedState = originalState.copyWith(
        query: 'updated',
        page: 1,
        loading: true,
      );

      expect(updatedState.query, equals('updated'));
      expect(updatedState.page, equals(1));
      expect(updatedState.loading, equals(true));
      expect(updatedState.items, equals([]));
    });

    test('copyWith should preserve original values when not specified', () {
      final originalState = HomesState(
        items: [],
        loading: false,
        query: 'original',
        page: 0,
        isDarkMode: true,
      );

      final updatedState = originalState.copyWith(query: 'updated');

      expect(updatedState.query, equals('updated'));
      expect(updatedState.loading, equals(false));
      expect(updatedState.page, equals(0));
      expect(updatedState.isDarkMode, equals(true));
    });

    test('props should include all properties', () {
      final state = HomesState(
        items: [],
        loading: true,
        fetchingMore: false,
        hasMore: true,
        query: 'test',
        category: Category.apartment,
        page: 1,
        error: 'error',
        version: 2,
        isDarkMode: false,
      );

      expect(state.props.length, equals(10));
      expect(
        state.props,
        containsAll([
          [],
          true,
          false,
          true,
          'test',
          Category.apartment,
          1,
          'error',
          2,
          false,
        ]),
      );
    });
  });
}
