import '../../model/entity/item.dart';
import '../api/home_api.dart';

abstract class HomeRepository {
  Future<List<Item>> fetchAll();
}

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this.api);

  final HomeApi api;

  @override
  Future<List<Item>> fetchAll() async {
    return api.getAllHomes();
  }
}
