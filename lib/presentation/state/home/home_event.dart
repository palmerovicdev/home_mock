import '../../../model/entity/item.dart';

abstract class HomesEvent {}

class HomesFetchFirst extends HomesEvent {}

class HomesFetchMore extends HomesEvent {}

class HomesChangeFavorite extends HomesEvent {
  final Item item;

  HomesChangeFavorite(this.item);
}

class HomesToggleTheme extends HomesEvent {}

class HomesChangeQuery extends HomesEvent {
  final String query;

  HomesChangeQuery(this.query);
}

class HomesChangeCategory extends HomesEvent {
  final Category? category;

  HomesChangeCategory(this.category);
}
