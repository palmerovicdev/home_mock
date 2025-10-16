import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_mock/model/entity/item.dart';
import 'package:home_mock/model/entity/owner.dart';
import 'package:home_mock/presentation/state/home/home_bloc.dart';
import 'package:home_mock/presentation/state/home/home_state.dart';
import 'package:home_mock/service/home_service.dart';

class MockHomeService implements HomeService {
  @override
  Future<List<Item>> fetchAllHomes() async {
    return createTestItems(count: 10);
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
  Future<void> close() async {
    await _streamController.close();
    await super.close();
  }
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
  List<Item>? allItems,
  List<Item>? items,
  bool loading = false,
  bool initialLoadComplete = false,
  String query = '',
  Category? category,
  String? error,
  int version = 0,
  bool isDarkMode = true,
  List<String>? selectedCities,
  List<String>? availableCities,
  double? minPriceFilter,
  double? maxPriceFilter,
  double? absoluteMinPrice,
  double? absoluteMaxPrice,
  SortBy? sortBy,
}) {
  return HomesState(
    allItems: allItems ?? [],
    items: items ?? [],
    loading: loading,
    initialLoadComplete: initialLoadComplete,
    query: query,
    category: category,
    error: error,
    version: version,
    selectedCities: selectedCities ?? [],
    availableCities: availableCities ?? [],
    minPriceFilter: minPriceFilter ?? 0,
    maxPriceFilter: maxPriceFilter ?? 10000,
    absoluteMinPrice: absoluteMinPrice ?? 0,
    absoluteMaxPrice: absoluteMaxPrice ?? 10000,
    sortBy: sortBy,
  );
}
