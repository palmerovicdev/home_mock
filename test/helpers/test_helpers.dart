import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_mock/model/entity/item.dart';
import 'package:home_mock/model/entity/owner.dart';
import 'package:home_mock/presentation/state/home/home_bloc.dart';
import 'package:home_mock/presentation/state/home/home_event.dart';
import 'package:home_mock/presentation/state/home/home_state.dart';
import 'package:home_mock/service/home_service.dart';

class MockHomeService implements HomeService {
  @override
  Future<List<Item>> fetchHomes({
    required int page,
    String query = '',
    Category? category,
  }) async {
    return createTestItems(count: 3);
  }
}

class MockHomesBloc extends HomesBloc {
  MockHomesBloc() : super(MockHomeService());

  @override
  HomesState get state => _state;
  HomesState _state = const HomesState();

  @override
  Stream<HomesState> get stream => _streamController.stream;
  final _streamController = StreamController<HomesState>.broadcast();

  void setState(HomesState newState) {
    _state = newState;
    _streamController.add(newState);
  }

  @override
  void add(HomesEvent event) {
    // Mock implementation
  }

  @override
  Future<void> close() async {
    await _streamController.close();
    await super.close();
  }
}

void registerFallbacks() {
  // No-op for now
}

Widget createTestWidget({
  required Widget child,
  HomesBloc? homesBloc,
  HomeService? homeService,
}) {
  return MaterialApp(
    home: BlocProvider<HomesBloc>(
      create: (context) => homesBloc ?? MockHomesBloc(),
      child: child,
    ),
  );
}

Item createTestItem({
  String id = 'test_id',
  String title = 'Test Property',
  String city = 'Test City',
  String imageUrl = 'https://example.com/image.jpg',
  int price = 1000,
  Category category = Category.apartment,
  String description = 'Test description',
  String size = '100 m²',
  int bedrooms = 2,
  int bathrooms = 1,
  bool isFavorite = false,
  Owner? owner,
}) {
  return Item(
    id: id,
    title: title,
    city: city,
    imageUrl: imageUrl,
    price: price,
    category: category,
    description: description,
    size: size,
    bedrooms: bedrooms,
    bathrooms: bathrooms,
    isFavorite: isFavorite,
    owner: owner ?? createTestOwner(),
  );
}

Owner createTestOwner({
  String name = 'Test Owner',
  String avatarUrl = 'https://example.com/avatar.jpg',
  String city = 'Test City',
}) {
  return Owner(
    name: name,
    avatarUrl: avatarUrl,
    city: city,
  );
}

List<Item> createTestItems({int count = 5}) {
  return List.generate(
    count,
    (index) => createTestItem(
      id: 'test_id_$index',
      title: 'Test Property $index',
      city: 'Test City $index',
      price: 1000 + (index * 100),
    ),
  );
}

HomesState createTestHomesState({
  List<Item>? items,
  bool loading = false,
  bool fetchingMore = false,
  bool hasMore = true,
  String query = '',
  Category? category,
  int page = 0,
  String? error,
  int version = 0,
  bool isDarkMode = true,
}) {
  return HomesState(
    items: items ?? [],
    loading: loading,
    fetchingMore: fetchingMore,
    hasMore: hasMore,
    query: query,
    category: category,
    page: page,
    error: error,
    version: version,
    isDarkMode: isDarkMode,
  );
}
