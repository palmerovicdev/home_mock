import '../data/repository/home_repository.dart';
import '../model/entity/item.dart';

abstract class HomeService {
  Future<List<Item>> fetchAllHomes();
}

class HomeServiceImpl implements HomeService {
  HomeServiceImpl(this.repository);

  final HomeRepository repository;

  @override
  Future<List<Item>> fetchAllHomes() async {
    return repository.fetchAll();
  }
}
