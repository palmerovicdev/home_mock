import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:home_mock/core/locator.dart';

import '../../../model/entity/item.dart';
import '../../../service/home_service.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomesBloc extends Bloc<HomesEvent, HomesState> {
  HomesBloc(this.service) : super(const HomesState()) {
    on<HomesLoadInitialData>(_onLoadInitialData);
    on<HomesChangeQuery>(_onChangeQuery);
    on<HomesChangeCategory>(_onChangeCategory);
    on<HomesToggleCityFilter>(_onToggleCityFilter);
    on<HomesChangePriceRange>(_onChangePriceRange);
    on<HomesChangeSortBy>(_onChangeSortBy);
    on<HomesClearFilters>(_onClearFilters);
    on<HomesRetryLoad>(_onRetryLoad);
    on<HomesChangeFavorite>(_onChangeFavorite);
    on<HomesToggleTheme>(_onToggleTheme);
  }

  final HomeService service;
  final searchController = TextEditingController();

  Future<void> _onLoadInitialData(
    HomesLoadInitialData e,
    Emitter<HomesState> emit,
  ) async {
    if (state.initialLoadComplete) {
      _applyFilters(emit);
      return;
    }

    emit(state.copyWith(loading: true, error: null));

    try {
      final allData = await service.fetchAllHomes();

      final prices = allData.map((e) => e.price.toDouble()).toList();
      final minPrice = prices.reduce((a, b) => a < b ? a : b);
      final maxPrice = prices.reduce((a, b) => a > b ? a : b);

      final cities = allData.map((e) => e.city).toSet().toList()..sort();

      emit(
        state.copyWith(
          allItems: allData,
          items: allData,
          loading: false,
          initialLoadComplete: true,
          availableCities: cities,
          absoluteMinPrice: minPrice,
          absoluteMaxPrice: maxPrice,
          minPriceFilter: minPrice,
          maxPriceFilter: maxPrice,
        ),
      );
    } catch (err) {
      emit(state.copyWith(loading: false, error: err.toString()));
    }
  }

  Future<void> _onRetryLoad(HomesRetryLoad e, Emitter<HomesState> emit) async {
    emit(state.copyWith(initialLoadComplete: false));
    add(HomesLoadInitialData());
  }

  Future<void> _onChangeQuery(
    HomesChangeQuery e,
    Emitter<HomesState> emit,
  ) async {
    emit(state.copyWith(loading: true, query: e.query));
    await Future.delayed(const Duration(milliseconds: 300));
    _applyFilters(emit);
  }

  Future<void> _onChangeCategory(
    HomesChangeCategory e,
    Emitter<HomesState> emit,
  ) async {
    emit(state.copyWith(loading: true, category: e.category));
    await Future.delayed(const Duration(milliseconds: 400));
    _applyFilters(emit);
  }

  Future<void> _onToggleCityFilter(
    HomesToggleCityFilter e,
    Emitter<HomesState> emit,
  ) async {
    final currentCities = List<String>.from(state.selectedCities);

    if (currentCities.contains(e.city)) {
      currentCities.remove(e.city);
    } else {
      currentCities.add(e.city);
    }

    emit(state.copyWith(loading: true, selectedCities: currentCities));
    await Future.delayed(const Duration(milliseconds: 200));
    _applyFilters(emit);
  }

  Future<void> _onChangePriceRange(
    HomesChangePriceRange e,
    Emitter<HomesState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
        minPriceFilter: e.min,
        maxPriceFilter: e.max,
      ),
    );
    await Future.delayed(const Duration(milliseconds: 200));
    _applyFilters(emit);
  }

  Future<void> _onChangeSortBy(
    HomesChangeSortBy e,
    Emitter<HomesState> emit,
  ) async {
    emit(state.copyWith(loading: true, sortBy: e.sortBy));
    await Future.delayed(
      const Duration(milliseconds: 200),
    );
    _applyFilters(emit);
  }

  Future<void> _onClearFilters(
    HomesClearFilters e,
    Emitter<HomesState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
        query: '',
        category: null,
        selectedCities: [],
        minPriceFilter: state.absoluteMinPrice,
        maxPriceFilter: state.absoluteMaxPrice,
        sortBy: null,
      ),
    );
    searchController.clear();
    await Future.delayed(const Duration(milliseconds: 200));
    _applyFilters(emit);
  }

  void _applyFilters(Emitter<HomesState> emit) {
    var filtered = List<Item>.from(state.allItems);

    if (state.query.isNotEmpty) {
      final query = state.query.toLowerCase();
      filtered = filtered.where((item) {
        return item.title.toLowerCase().contains(query) || item.city.toLowerCase().contains(query);
      }).toList();
    }

    if (state.category != null && state.category != Category.all) {
      filtered = filtered.where((item) => item.category == state.category).toList();
    }

    if (state.selectedCities.isNotEmpty) {
      filtered = filtered.where((item) => state.selectedCities.contains(item.city)).toList();
    }

    filtered = filtered.where((item) {
      return item.price >= state.minPriceFilter && item.price <= state.maxPriceFilter;
    }).toList();

    if (state.sortBy != null) {
      switch (state.sortBy!) {
        case SortBy.priceAsc:
          filtered.sort((a, b) => a.price.compareTo(b.price));
          break;
        case SortBy.priceDesc:
          filtered.sort((a, b) => b.price.compareTo(a.price));
          break;
        case SortBy.city:
          filtered.sort((a, b) => a.city.compareTo(b.city));
          break;
      }
    }

    emit(state.copyWith(items: filtered, loading: false));
  }

  Future<void> _onChangeFavorite(
    HomesChangeFavorite e,
    Emitter<HomesState> emit,
  ) async {
    final updatedAllItems = state.allItems.map((item) {
      return item.id == e.item.id ? e.item : item;
    }).toList();

    final updatedItems = state.items.map((item) {
      return item.id == e.item.id ? e.item : item;
    }).toList();

    emit(
      state.copyWith(
        allItems: updatedAllItems,
        items: updatedItems,
        version: state.version + 1,
      ),
    );
  }

  FutureOr<void> _onToggleTheme(
    HomesToggleTheme event,
    Emitter<HomesState> emit,
  ) async {
    await theme.toggleDarkMode();
    emit(state.copyWith(isDarkMode: !state.isDarkMode));
  }
}
