import '../data/repository/home_repository.dart';
import '../model/entity/item.dart';

abstract class HomeService {
  Future<List<Item>> fetchHomes({
    required int page,
    String query = '',
    Category? category,
  });
}

class HomeServiceImpl implements HomeService {
  HomeServiceImpl(this.repository);

  final HomeRepository repository;

  @override
  Future<List<Item>> fetchHomes({
    required int page,
    String query = '',
    Category? category,
  }) async {
    return repository.fetch(
      page: page,
      query: query,
      category: category,
    );
  }
}
