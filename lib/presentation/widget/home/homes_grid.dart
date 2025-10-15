import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/home/home_bloc.dart';
import '../../state/home/home_state.dart';
import '../shimmer_loading.dart';
import 'empty_state.dart';
import 'error_state.dart';
import 'home_card.dart';

class HomesGrid extends StatelessWidget {
  const HomesGrid({super.key});

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
          return const SliverToBoxAdapter(
            child: ErrorState(),
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
            child: EmptyState(hasActiveFilters: state.hasActiveFilters),
          );
        }

        // Grid de propiedades con skeleton durante filtrado
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverLayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.crossAxisExtent;
              final cross = width >= 700 ? 3 : 2;
              const childAspect = 0.75;

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
                    child: HomeCard(item: items[i]),
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
