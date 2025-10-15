import '../../../model/entity/item.dart';
import 'home_state.dart';

abstract class HomesEvent {}

class HomesLoadInitialData extends HomesEvent {}

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

class HomesToggleCityFilter extends HomesEvent {
  final String city;

  HomesToggleCityFilter(this.city);
}

class HomesChangePriceRange extends HomesEvent {
  final double min;
  final double max;

  HomesChangePriceRange(this.min, this.max);
}

class HomesChangeSortBy extends HomesEvent {
  final SortBy? sortBy;

  HomesChangeSortBy(this.sortBy);
}

class HomesClearFilters extends HomesEvent {}

class HomesRetryLoad extends HomesEvent {}
