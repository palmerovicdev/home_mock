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
      'should emit loading state then success state with items on fetch first',
      () async {
        final items = createTestItems(count: 3);

        homesBloc.add(HomesFetchFirst());

        await Future.delayed(const Duration(milliseconds: 100));

        expect(homesBloc.state.items.length, equals(3));
        expect(homesBloc.state.loading, equals(false));
        expect(homesBloc.state.page, equals(1));
      },
    );

    test('should emit loading state then error state on failure', () async {
      final failingService = FailingHomeService();
      final failingBloc = HomesBloc(failingService);

      failingBloc.add(HomesFetchFirst());

      await Future.delayed(const Duration(milliseconds: 100));

      expect(failingBloc.state.error, isNotNull);
      expect(failingBloc.state.loading, equals(false));

      failingBloc.close();
    });

    test('should update query and trigger fetch first', () async {
      homesBloc.add(HomesChangeQuery('test query'));

      await Future.delayed(const Duration(milliseconds: 100));

      expect(homesBloc.state.query, equals('test query'));
    });

    test('should update category and trigger fetch first', () async {
      homesBloc.add(HomesChangeCategory(Category.apartment));

      await Future.delayed(const Duration(milliseconds: 100));

      expect(homesBloc.state.category, equals(Category.apartment));
    });

    test('should update favorite status of specific item', () {
      final items = createTestItems(count: 3);
      final updatedItem = items[0].copyWith(isFavorite: true);

      homesBloc.add(HomesChangeFavorite(updatedItem));

      expect(homesBloc.state.version, equals(1));
    });

    test('should toggle dark mode', () {
      homesBloc.add(HomesToggleTheme());

      expect(homesBloc.state.isDarkMode, equals(false));
    });
  });
}

class FailingHomeService implements HomeService {
  @override
  Future<List<Item>> fetchHomes({
    required int page,
    String query = '',
    Category? category,
  }) async {
    throw Exception('Test error');
  }
}
