import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_motionly/widget/button/pulsating_button.dart';
import 'package:lottie/lottie.dart';

import '../../../core/locator.dart';
import '../../../gen/assets.gen.dart';
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
          Lottie.asset(
            Assets.animations.info,
            width: 200,
            height: 200,
            fit: BoxFit.cover,
            repeat: true,
          ),
          const SizedBox(height: 16),
          Text(
            'No encontramos resultados',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: theme.text,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            hasActiveFilters ? 'Intenta ajustar tus filtros' : 'No hay propiedades disponibles',
            style: TextStyle(
              color: theme.textMuted,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          if (hasActiveFilters) ...[
            const SizedBox(height: 12),
            SizedBox(
              height: 50,
              width: 180,
              child: Center(
                child: PulsatingButton(
                  height: 40,
                  width: 160,
                  onClick: () {
                    context.read<HomesBloc>().add(HomesClearFilters());
                  },
                  color: theme.primary,
                  borderRadius: BorderRadius.circular(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.clear_all, color: theme.bgDark),
                      Text(
                        'Limpiar filtros',
                        style: TextStyle(
                          color: theme.bgDark,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
