import 'package:equatable/equatable.dart';

import '../../../model/entity/item.dart';

enum SortBy { priceAsc, priceDesc, city }

class HomesState extends Equatable {
  final List<Item> allItems;
  final List<Item> items;
  final bool loading;
  final bool initialLoadComplete;
  final String query;
  final Category? category;
  final String? error;
  final int version;

  final List<String> selectedCities;
  final List<String> availableCities;
  final double minPriceFilter;
  final double maxPriceFilter;
  final double absoluteMinPrice;
  final double absoluteMaxPrice;

  final SortBy? sortBy;

  const HomesState({
    this.allItems = const [],
    this.items = const [],
    this.loading = false,
    this.initialLoadComplete = false,
    this.query = '',
    this.category,
    this.error,
    this.version = 0,
    this.selectedCities = const [],
    this.availableCities = const [],
    this.minPriceFilter = 0,
    this.maxPriceFilter = 10000,
    this.absoluteMinPrice = 0,
    this.absoluteMaxPrice = 10000,
    this.sortBy,
  });

  @override
  List<Object?> get props => [
    allItems,
    items,
    loading,
    initialLoadComplete,
    query,
    category,
    error,
    version,
    selectedCities,
    availableCities,
    minPriceFilter,
    maxPriceFilter,
    absoluteMinPrice,
    absoluteMaxPrice,
    sortBy,
  ];

  HomesState copyWith({
    List<Item>? allItems,
    List<Item>? items,
    bool? loading,
    bool? initialLoadComplete,
    String? query,
    Category? category,
    String? error,
    int? version,
    bool? isDarkMode,
    List<String>? selectedCities,
    List<String>? availableCities,
    double? minPriceFilter,
    double? maxPriceFilter,
    double? absoluteMinPrice,
    double? absoluteMaxPrice,
    SortBy? sortBy,
  }) => HomesState(
    allItems: allItems ?? this.allItems,
    items: items ?? this.items,
    loading: loading ?? this.loading,
    initialLoadComplete: initialLoadComplete ?? this.initialLoadComplete,
    query: query ?? this.query,
    category: category ?? this.category,
    error: error,
    version: version ?? this.version + 1,
    selectedCities: selectedCities ?? this.selectedCities,
    availableCities: availableCities ?? this.availableCities,
    minPriceFilter: minPriceFilter ?? this.minPriceFilter,
    maxPriceFilter: maxPriceFilter ?? this.maxPriceFilter,
    absoluteMinPrice: absoluteMinPrice ?? this.absoluteMinPrice,
    absoluteMaxPrice: absoluteMaxPrice ?? this.absoluteMaxPrice,
    sortBy: sortBy ?? this.sortBy,
  );

  bool get hasActiveFilters =>
      query.isNotEmpty || category != null && category != Category.all || selectedCities.isNotEmpty || minPriceFilter > absoluteMinPrice || maxPriceFilter < absoluteMaxPrice;
}
