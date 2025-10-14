import 'package:equatable/equatable.dart';

import '../../../model/entity/item.dart';

class HomesState extends Equatable {
  final List<Item> items;
  final bool loading, fetchingMore, hasMore;
  final String query;
  final Category? category;
  final int page;
  final String? error;
  final int version;
  final bool isDarkMode;

  const HomesState({
    this.items = const [],
    this.loading = false,
    this.fetchingMore = false,
    this.hasMore = true,
    this.query = '',
    this.category,
    this.page = 0,
    this.error,
    this.version = 0,
    this.isDarkMode = true,
  });

  @override
  List<Object?> get props => [
    items,
    loading,
    fetchingMore,
    hasMore,
    query,
    category,
    page,
    error,
    version,
    isDarkMode,
  ];

  HomesState copyWith({
    List<Item>? items,
    bool? loading,
    bool? fetchingMore,
    bool? hasMore,
    String? query,
    Category? category,
    int? page,
    String? error,
    int? version,
    bool? isDarkMode,
  }) => HomesState(
    items: items ?? this.items,
    loading: loading ?? this.loading,
    fetchingMore: fetchingMore ?? this.fetchingMore,
    hasMore: hasMore ?? this.hasMore,
    query: query ?? this.query,
    category: category ?? this.category,
    page: page ?? this.page,
    error: error,
    version: version ?? this.version + 1,
    isDarkMode: isDarkMode ?? this.isDarkMode,
  );
}
