import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:home_mock/core/locator.dart';

import '../../../service/home_service.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomesBloc extends Bloc<HomesEvent, HomesState> {
  HomesBloc(this.service) : super(const HomesState()) {
    on<HomesFetchFirst>(_onFetchFirst);
    on<HomesFetchMore>(_onFetchMore);
    on<HomesChangeQuery>(_onChangeQuery);
    on<HomesChangeCategory>(_onChangeCategory);
    on<HomesChangeFavorite>(_onChangeFavorite);
    on<HomesToggleTheme>(_onToggleTheme);
  }

  final HomeService service;

  Future<void> _onFetchFirst(HomesFetchFirst e, Emitter<HomesState> emit) async {
    emit(
      state.copyWith(
        loading: true,
        items: [],
        page: 0,
        hasMore: true,
        error: null,
      ),
    );
    try {
      final data = await service.fetchHomes(
        page: 1,
        query: state.query,
        category: state.category,
      );
      emit(
        state.copyWith(
          items: data,
          loading: false,
          page: 1,
          hasMore: data.isNotEmpty,
        ),
      );
    } catch (err) {
      emit(state.copyWith(loading: false, error: err.toString()));
    }
  }

  Future<void> _onFetchMore(HomesFetchMore e, Emitter<HomesState> emit) async {
    if (state.fetchingMore || !state.hasMore || state.loading) return;
    emit(state.copyWith(fetchingMore: true, error: null));
    try {
      final next = state.page + 1;
      final data = await service.fetchHomes(
        page: next,
        query: state.query,
        category: state.category,
      );
      emit(
        state.copyWith(
          items: [...state.items, ...data],
          fetchingMore: false,
          page: next,
          hasMore: data.isNotEmpty,
        ),
      );
    } catch (err) {
      emit(state.copyWith(fetchingMore: false, error: err.toString()));
    }
  }

  Future<void> _onChangeQuery(HomesChangeQuery e, Emitter<HomesState> emit) async {
    emit(state.copyWith(query: e.query));
    add(HomesFetchFirst());
  }

  Future<void> _onChangeCategory(HomesChangeCategory e, Emitter<HomesState> emit) async {
    emit(state.copyWith(category: e.category));
    add(HomesFetchFirst());
  }

  Future<void> _onChangeFavorite(HomesChangeFavorite e, Emitter<HomesState> emit) async {
    final updatedItems = state.items.map((item) {
      return item.id == e.item.id ? e.item : item;
    }).toList();
    emit(state.copyWith(items: updatedItems, version: state.version + 1));
  }

  FutureOr<void> _onToggleTheme(HomesToggleTheme event, Emitter<HomesState> emit) {
    theme.isDark = !theme.isDark;
    emit(state.copyWith(isDarkMode: !state.isDarkMode));
  }
}
