import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_motionly/widget/button/ripple_reveal_button.dart';
import 'package:go_router/go_router.dart';
import 'package:home_mock/core/router/routes.dart';
import 'package:home_mock/presentation/widget/like_button.dart';

import '../../core/locator.dart';
import '../../model/entity/item.dart';
import '../state/home/home_bloc.dart';
import '../state/home/home_event.dart';
import '../state/home/home_state.dart';
import '../widget/cached_image.dart';
import '../widget/shimmer_loading.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scroll = ScrollController();
  final _searchCtrl = TextEditingController();
  bool _showFilters = false;

  @override
  void initState() {
    super.initState();
    context.read<HomesBloc>().add(HomesLoadInitialData());
  }

  @override
  void dispose() {
    _scroll.dispose();
    _searchCtrl.dispose();
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
                    SliverToBoxAdapter(child: _Header()),
                    SliverToBoxAdapter(
                      child: FadeInLeft(
                        duration: const Duration(milliseconds: 200),
                        child: _SearchBar(controller: _searchCtrl),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: _CategoryRow(selected: state.category),
                    ),
                    if (state.initialLoadComplete) ...[
                      SliverToBoxAdapter(
                        child: _FilterSection(
                          showFilters: _showFilters,
                          onToggleFilters: () {
                            setState(() => _showFilters = !_showFilters);
                          },
                        ),
                      ),
                      if (_showFilters) ...[
                        SliverToBoxAdapter(child: _SortSection()),
                        SliverToBoxAdapter(child: _CityFilters()),
                        SliverToBoxAdapter(child: _PriceRangeFilter()),
                      ],
                    ],
                    const SliverPadding(padding: EdgeInsets.only(top: 8)),
                    _HomesGrid(),
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

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(
                  'https://i.pravatar.cc/100',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Hi, You',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: theme.text,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  context.read<HomesBloc>().add(HomesToggleTheme());
                },
                icon: Icon(
                  context.read<HomesBloc>().state.isDarkMode
                      ? Icons.light_mode
                      : Icons.dark_mode,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Buy Your\n',
                  style: TextStyle(
                    fontSize: 22,
                    color: theme.textMuted,
                  ),
                ),
                TextSpan(
                  text: 'Perfect Home 🏠',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: theme.text,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomesBloc>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        onChanged: (v) => bloc.add(HomesChangeQuery(v)),
        style: TextStyle(color: theme.text),
        cursorColor: theme.primary,
        textInputAction: TextInputAction.search,
        autocorrect: false,
        enableSuggestions: false,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: 'Find your next home',
          hintStyle: TextStyle(color: theme.textMuted),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Icon(
              Icons.search,
              color: theme.primary,
            ),
          ),
          filled: true,
          fillColor: theme.bgLight,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}

class _CategoryRow extends StatelessWidget {
  const _CategoryRow({this.selected});

  final Category? selected;

  @override
  Widget build(BuildContext context) {
    final entries = const [
      (Category.apartment, Icons.apartment, 'Apartment'),
      (Category.house, Icons.house_rounded, 'House'),
    ];
    final bloc = context.read<HomesBloc>();

    Widget chip(bool active, IconData icon, String label, VoidCallback onTap) {
      return Padding(
        padding: const EdgeInsets.only(right: 12),
        child: SizedBox(
          width: 140,
          child: RippleRevealButton(
            duration: Duration(milliseconds: 300),
            height: 60,
            alignment: AlignmentGeometry.center,
            widgetA: Row(
              spacing: 8,
              children: [
                Icon(icon, color: theme.text),
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: theme.text,
                  ),
                ),
              ],
            ),
            widgetB: Row(
              spacing: 8,
              children: [
                Icon(icon, color: theme.bgDark),
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: theme.bgDark,
                  ),
                ),
              ],
            ),
            backgroundColorA: theme.primary,
            backgroundColorB: theme.bgDark,
            radius: 24,
            rippleColorA: theme.bgDark,
            rippleColorB: theme.primary,
            selected: !active,
            onPressed: () {
              if (active) {
                bloc.add(HomesChangeCategory(Category.all));
                return;
              }
              onTap.call();
            },
          ),
        ),
      );
    }

    return SizedBox(
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 4),
        children: [
          FadeInLeft(
            duration: const Duration(milliseconds: 400),
            child: chip(
              selected == Category.apartment,
              entries[0].$2,
              entries[0].$3,
              () => bloc.add(HomesChangeCategory(Category.apartment)),
            ),
          ),
          FadeInLeft(
            delay: const Duration(milliseconds: 400),
            duration: const Duration(milliseconds: 400),
            child: chip(
              selected == Category.house,
              entries[1].$2,
              entries[1].$3,
              () => bloc.add(HomesChangeCategory(Category.house)),
            ),
          ),
          FadeInLeft(
            delay: const Duration(milliseconds: 800),
            duration: const Duration(milliseconds: 400),
            child: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: TextButton(
                onPressed: () => bloc.add(HomesChangeCategory(Category.all)),
                child: Text(
                  'All',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: theme.textMuted,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterSection extends StatelessWidget {
  const _FilterSection({
    required this.showFilters,
    required this.onToggleFilters,
  });

  final bool showFilters;
  final VoidCallback onToggleFilters;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomesBloc, HomesState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            children: [
              Text(
                '${state.items.length} propiedades',
                style: TextStyle(
                  color: theme.textMuted,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              if (state.hasActiveFilters)
                TextButton.icon(
                  onPressed: () {
                    context.read<HomesBloc>().add(HomesClearFilters());
                  },
                  icon: Icon(Icons.clear, size: 16, color: theme.primary),
                  label: Text(
                    'Limpiar',
                    style: TextStyle(color: theme.primary),
                  ),
                ),
              IconButton(
                onPressed: onToggleFilters,
                icon: Icon(
                  showFilters ? Icons.filter_list_off : Icons.filter_list,
                  color: showFilters ? theme.primary : theme.textMuted,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SortSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomesBloc, HomesState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ordenar por',
                style: TextStyle(
                  color: theme.text,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _SortChip(
                    label: 'Precio: Menor',
                    icon: Icons.arrow_upward,
                    isSelected: state.sortBy == SortBy.priceAsc,
                    onTap: () {
                      context.read<HomesBloc>().add(
                        HomesChangeSortBy(
                          state.sortBy == SortBy.priceAsc
                              ? null
                              : SortBy.priceAsc,
                        ),
                      );
                    },
                  ),
                  _SortChip(
                    label: 'Precio: Mayor',
                    icon: Icons.arrow_downward,
                    isSelected: state.sortBy == SortBy.priceDesc,
                    onTap: () {
                      context.read<HomesBloc>().add(
                        HomesChangeSortBy(
                          state.sortBy == SortBy.priceDesc
                              ? null
                              : SortBy.priceDesc,
                        ),
                      );
                    },
                  ),
                  _SortChip(
                    label: 'Ciudad',
                    icon: Icons.location_city,
                    isSelected: state.sortBy == SortBy.city,
                    onTap: () {
                      context.read<HomesBloc>().add(
                        HomesChangeSortBy(
                          state.sortBy == SortBy.city ? null : SortBy.city,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SortChip extends StatelessWidget {
  const _SortChip({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: isSelected ? theme.bgDark : theme.text,
          ),
          const SizedBox(width: 4),
          Text(label),
        ],
      ),
      selected: isSelected,
      onSelected: (_) => onTap(),
      backgroundColor: theme.bgLight,
      selectedColor: theme.primary,
      labelStyle: TextStyle(
        color: isSelected ? theme.bgDark : theme.text,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide.none,
      ),
    );
  }
}

class _CityFilters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomesBloc, HomesState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Filtrar por ciudad',
                style: TextStyle(
                  color: theme.text,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: state.availableCities.map((city) {
                  final isSelected = state.selectedCities.contains(city);
                  return FilterChip(
                    label: Text(city),
                    selected: isSelected,
                    onSelected: (_) {
                      context.read<HomesBloc>().add(
                        HomesToggleCityFilter(city),
                      );
                    },
                    backgroundColor: theme.bgLight,
                    selectedColor: theme.primary,
                    labelStyle: TextStyle(
                      color: isSelected ? theme.bgDark : theme.text,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w400,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide.none,
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PriceRangeFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomesBloc, HomesState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rango de precio',
                style: TextStyle(
                  color: theme.text,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    '\$${state.minPriceFilter.toInt()}',
                    style: TextStyle(
                      color: theme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '\$${state.maxPriceFilter.toInt()}',
                    style: TextStyle(
                      color: theme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              RangeSlider(
                values: RangeValues(
                  state.minPriceFilter,
                  state.maxPriceFilter,
                ),
                min: state.absoluteMinPrice,
                max: state.absoluteMaxPrice,
                divisions: 50,
                activeColor: theme.primary,
                inactiveColor: theme.bgLight,
                onChanged: (values) {
                  context.read<HomesBloc>().add(
                    HomesChangePriceRange(values.start, values.end),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class _HomesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomesBloc, HomesState>(
      buildWhen: (a, b) =>
          a.items != b.items ||
          a.loading != b.loading ||
          a.version != b.version ||
          a.error != b.error,
      builder: (context, state) {
        final items = state.items;

        // Estado de error
        if (state.error != null && !state.initialLoadComplete) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 80,
                    color: theme.textMuted,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '¡Oops! Algo salió mal',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: theme.text,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'No pudimos cargar las propiedades',
                    style: TextStyle(
                      color: theme.textMuted,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () {
                      context.read<HomesBloc>().add(HomesRetryLoad());
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text('Reintentar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primary,
                      foregroundColor: theme.bgDark,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        // Estado de carga inicial con skeleton
        if (state.loading && !state.initialLoadComplete) {
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, i) => const HomeCardSkeleton(),
                childCount: 6,
              ),
            ),
          );
        }

        // Estado vacío cuando no hay resultados
        if (!state.loading && items.isEmpty && state.initialLoadComplete) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  Icon(
                    Icons.search_off,
                    size: 80,
                    color: theme.textMuted,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No encontramos resultados',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: theme.text,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    state.hasActiveFilters
                        ? 'Intenta ajustar tus filtros'
                        : 'No hay propiedades disponibles',
                    style: TextStyle(
                      color: theme.textMuted,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  if (state.hasActiveFilters) ...[
                    const SizedBox(height: 24),
                    OutlinedButton.icon(
                      onPressed: () {
                        context.read<HomesBloc>().add(HomesClearFilters());
                      },
                      icon: const Icon(Icons.clear_all),
                      label: const Text('Limpiar filtros'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: theme.primary,
                        side: BorderSide(color: theme.primary),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        }

        // Grid de propiedades con skeleton durante filtrado
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverLayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.crossAxisExtent;
              final cross = width >= 700 ? 3 : 2;
              final childAspect = 0.75;

              if (state.loading && state.initialLoadComplete) {
                // Mostrar skeleton mientras se filtra
                return SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: cross,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: childAspect,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, i) => const HomeCardSkeleton(),
                    childCount: items.isEmpty ? 6 : items.length,
                  ),
                );
              }

              return SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cross,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: childAspect,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, i) => FadeInUp(
                    from: 30,
                    delay: Duration(milliseconds: i * 40),
                    duration: const Duration(milliseconds: 100),
                    child: _HomeCard(item: items[i]),
                  ),
                  childCount: items.length,
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class _HomeCard extends StatelessWidget {
  const _HomeCard({
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    final price = '\$${item.price}/m';
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: GestureDetector(
        onTap: () => context.pushNamed(Routes.details.name, extra: item.id),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Hero(
              tag: 'home_${item.id}',
              child: CachedImage(
                imageUrl: item.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            context.read<HomesBloc>().state.isDarkMode
                ? DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, theme.bgDark],
                        stops: [0.4, 1.0],
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: !context.read<HomesBloc>().state.isDarkMode
                      ? theme.bgDark
                      : theme.bg.withAlpha(200),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  item.category.name[0].toUpperCase() +
                      item.category.name.substring(1),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: theme.text,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 8,
              right: 8,
              bottom: 12,
              child: _InfoCard(
                title: item.title,
                city: item.city,
                price: price,
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: SizedBox(
                width: 36,
                child: LikeButton(item: item),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.title,
    required this.city,
    required this.price,
  });

  final String title, city, price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
        color: context.read<HomesBloc>().state.isDarkMode
            ? theme.bgLight.withAlpha(120)
            : theme.bgDark,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: theme.text,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 12,
                color: theme.textMuted,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  city,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: theme.textMuted, fontSize: 12),
                ),
              ),
            ],
          ),
          Text(
            price,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: theme.text,
            ),
          ),
        ],
      ),
    );
  }
}
