import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/locator.dart';
import '../../state/home/home_bloc.dart';
import '../../state/home/home_event.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.hasActiveFilters,
  });

  final bool hasActiveFilters;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            hasActiveFilters
                ? 'Intenta ajustar tus filtros'
                : 'No hay propiedades disponibles',
            style: TextStyle(
              color: theme.textMuted,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          if (hasActiveFilters) ...[
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
    );
  }
}
