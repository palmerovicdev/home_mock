import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_corner_radius/screen_corner_radius.dart';

import '../../core/locator.dart';
import '../state/home/home_bloc.dart';
import '../state/home/home_event.dart';
import '../state/home/home_state.dart';
import 'home_section/category_row.dart';
import 'home_section/filter_section.dart';
import 'home_section/home_header.dart';
import 'home_section/home_search_bar.dart';
import 'home_section/homes_grid.dart';

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
    final screenHeight = MediaQuery.of(context).size.height;
    final headerFlex = screenHeight < 700
        ? 8
        : screenHeight < 900
        ? 10
        : 12;
    final gridFlex = screenHeight < 700
        ? 19
        : screenHeight < 900
        ? 17
        : 15;

    return BlocBuilder<HomesBloc, HomesState>(
      buildWhen: (a, b) => a.isDarkMode != b.isDarkMode,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: theme.bgDark,
          body: BlocBuilder<HomesBloc, HomesState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  children: [
                    Expanded(
                      flex: headerFlex,
                      child: Container(
                        decoration: BoxDecoration(
                          color: theme.sBgDark,
                          borderRadius: BorderRadiusGeometry.only(
                            topLeft: Radius.circular(locator.get<ScreenRadius>().topLeft - 4),
                            topRight: Radius.circular(locator.get<ScreenRadius>().topRight - 4),
                            bottomLeft: Radius.circular(locator.get<ScreenRadius>().bottomLeft - 24),
                            bottomRight: Radius.circular(locator.get<ScreenRadius>().bottomRight - 24),
                          ),
                        ),
                        child: SafeArea(
                          bottom: false,
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              final isCompact = constraints.maxHeight < 150;

                              return Column(
                                mainAxisAlignment: isCompact ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
                                children: [
                                  if (!isCompact) HomeHeader(),
                                  if (isCompact)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                                      child: HomeHeader(),
                                    ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      bottom: isCompact ? 8.0 : 16.0,
                                    ),
                                    child: FadeInLeft(
                                      duration: const Duration(milliseconds: 200),
                                      child: HomeSearchBar(
                                        controller: context.read<HomesBloc>().searchController,
                                        onFilterPressed: () {
                                          setState(() => _showFilters = !_showFilters);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: gridFlex,
                      child: RefreshIndicator(
                        onRefresh: () async {
                          context.read<HomesBloc>().add(HomesRetryLoad());
                          await context.read<HomesBloc>().stream.firstWhere(
                            (state) => !state.loading,
                          );
                        },
                        color: theme.primary,
                        backgroundColor: theme.bgDark,
                        strokeWidth: 3.0,
                        child: CustomScrollView(
                          controller: _scroll,
                          slivers: [
                            if (!(!state.loading && state.items.isEmpty && state.initialLoadComplete))
                              SliverToBoxAdapter(
                                child: CategoryRow(selected: state.category),
                              ),
                            if (state.initialLoadComplete) ...[
                              SliverToBoxAdapter(
                                child: FilterSection(
                                  showFilters: _showFilters,
                                ),
                              ),
                            ],
                            const SliverPadding(padding: EdgeInsets.only(top: 8)),
                            const HomesGrid(),
                            const SliverPadding(padding: EdgeInsets.only(bottom: 90)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
