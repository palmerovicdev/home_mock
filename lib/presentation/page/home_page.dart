import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/locator.dart';
import '../state/home/home_bloc.dart';
import '../state/home/home_event.dart';
import '../state/home/home_state.dart';
import '../widget/home/category_row.dart';
import '../widget/home/city_filters.dart';
import '../widget/home/filter_section.dart';
import '../widget/home/home_header.dart';
import '../widget/home/home_search_bar.dart';
import '../widget/home/homes_grid.dart';
import '../widget/home/price_range_filter.dart';
import '../widget/home/sort_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scroll = ScrollController();
  bool _showFilters = false;

  @override
  void initState() {
    super.initState();
    context.read<HomesBloc>().add(HomesLoadInitialData());
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomesBloc, HomesState>(
      buildWhen: (a, b) => a.isDarkMode != b.isDarkMode,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: theme.bgDark,
          body: SafeArea(
            child: BlocBuilder<HomesBloc, HomesState>(
              builder: (context, state) {
                return CustomScrollView(
                  controller: _scroll,
                  slivers: [
                    SliverToBoxAdapter(child: HomeHeader()),
                    SliverToBoxAdapter(
                      child: FadeInLeft(
                        duration: const Duration(milliseconds: 200),
                        child: HomeSearchBar(
                          controller: context.read<HomesBloc>().searchController,
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: CategoryRow(selected: state.category),
                    ),
                    if (state.initialLoadComplete) ...[
                      SliverToBoxAdapter(
                        child: FilterSection(
                          showFilters: _showFilters,
                          onToggleFilters: () {
                            setState(() => _showFilters = !_showFilters);
                          },
                        ),
                      ),
                      if (_showFilters) ...[
                        const SliverToBoxAdapter(child: SortSection()),
                        const SliverToBoxAdapter(child: CityFilters()),
                        const SliverToBoxAdapter(child: PriceRangeFilter()),
                      ],
                    ],
                    const SliverPadding(padding: EdgeInsets.only(top: 8)),
                    const HomesGrid(),
                    const SliverPadding(padding: EdgeInsets.only(bottom: 90)),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
