import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_motionly/widget/button/ripple_reveal_button.dart';
import 'package:go_router/go_router.dart';
import 'package:home_mock/core/router/routes.dart';

import '../../core/locator.dart';
import '../../model/entity/item.dart';
import '../state/home/home_bloc.dart';
import '../state/home/home_event.dart';
import '../state/home/home_state.dart';
import '../widget/cached_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scroll = ScrollController();
  final _searchCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<HomesBloc>().add(HomesChangeCategory(null));
    _scroll.addListener(() {
      final bloc = context.read<HomesBloc>();
      if (_scroll.position.pixels >= _scroll.position.maxScrollExtent - 400) {
        bloc.add(HomesFetchMore());
      }
    });
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
                    SliverToBoxAdapter(child: _SearchBar(controller: _searchCtrl)),
                    SliverToBoxAdapter(child: _CategoryRow(selected: state.category)),
                    const SliverPadding(padding: EdgeInsets.only(top: 8)),
                    _HomesGrid(),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Center(
                          child: state.loading
                              ? const CircularProgressIndicator()
                              : state.fetchingMore
                              ? const CircularProgressIndicator(strokeWidth: 2)
                              : state.hasMore
                              ? const SizedBox.shrink()
                              : Text('No more results', style: TextStyle(color: theme.textMuted)),
                        ),
                      ),
                    ),
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
                  context.read<HomesBloc>().state.isDarkMode ? Icons.light_mode : Icons.dark_mode
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
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
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
                  style: TextStyle(fontWeight: FontWeight.w600, color: theme.text),
                ),
              ],
            ),
            widgetB: Row(
              spacing: 8,
              children: [
                Icon(icon, color: theme.bgDark),
                Text(
                  label,
                  style: TextStyle(fontWeight: FontWeight.w600, color: theme.bgDark),
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
          chip(selected == Category.apartment, entries[0].$2, entries[0].$3, () => bloc.add(HomesChangeCategory(Category.apartment))),
          chip(selected == Category.house, entries[1].$2, entries[1].$3, () => bloc.add(HomesChangeCategory(Category.house))),
          Padding(
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
        ],
      ),
    );
  }
}

class _HomesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomesBloc, HomesState>(
      buildWhen: (a, b) => a.items != b.items || a.loading != b.loading || a.version != b.version,
      builder: (context, state) {
        final items = state.items;
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverLayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.crossAxisExtent;

              final cross = width >= 700 ? 3 : 2;
              final childAspect = 0.75;

              if (!state.loading && items.isEmpty) {
                return SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(top: 32),
                    child: Center(
                      child: Text('No results', style: TextStyle(color: theme.text)),
                    ),
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
                  (context, i) => Padding(
                    padding: const EdgeInsets.all(1.0),
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
                  color: !context.read<HomesBloc>().state.isDarkMode ? theme.bgDark : theme.bg.withAlpha(200),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  item.category.name[0].toUpperCase() + item.category.name.substring(1),
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
              child: _InfoCard(title: item.title, city: item.city, price: price),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: SizedBox(
                width: 36,
                child: RippleRevealButton(
                  widgetA: Center(
                    child: Icon(
                      item.isFavorite ? Icons.favorite : Icons.favorite_border,
                      size: 18,
                      color: item.isFavorite ? Colors.redAccent : theme.textMuted,
                    ),
                  ),
                  widgetB: Center(
                    child: Icon(
                      item.isFavorite ? Icons.favorite : Icons.favorite_border,
                      size: 18,
                      color: item.isFavorite ? Colors.redAccent : theme.textMuted,
                    ),
                  ),
                  height: 36,
                  padding: EdgeInsets.zero,
                  selected: item.isFavorite,
                  backgroundColorA: !context.read<HomesBloc>().state.isDarkMode ? theme.bgDark : theme.bgDark.withAlpha(120),
                  backgroundColorB: !context.read<HomesBloc>().state.isDarkMode ? theme.bgDark.withAlpha(254) : theme.bgDark.withAlpha(121),
                  rippleColorA: theme.warning.withAlpha(300),
                  rippleColorB: theme.bgDark.withAlpha(31),
                  radius: 32,
                  duration: const Duration(milliseconds: 200),
                  onPressed: () {
                    context.read<HomesBloc>().add(
                      HomesChangeFavorite(
                        item.copyWith(
                          isFavorite: !item.isFavorite,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.title, required this.city, required this.price});

  final String title, city, price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
        color: context.read<HomesBloc>().state.isDarkMode ? theme.bgLight.withAlpha(120) : theme.bgDark,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: theme.text),
          ),
          Row(
            children: [
              Icon(Icons.location_on_outlined, size: 12, color: theme.textMuted),
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
