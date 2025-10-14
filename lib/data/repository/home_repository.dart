import '../../model/entity/item.dart';
import '../api/home_api.dart';

abstract class HomeRepository {
  Future<List<Item>> fetch({
    required int page,
    String query = '',
    Category? category,
  });
}

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this.api);

  final HomeApi api;

  @override
  Future<List<Item>> fetch({
    required int page,
    String query = '',
    Category? category,
  }) async {
    return api.getHomes(
      page: page,
      query: query,
      category: category,
    );
  }
}
