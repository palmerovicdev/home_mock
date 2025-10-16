import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_motionly/widget/button/ripple_reveal_button.dart';

import '../../../core/locator.dart';
import '../../state/home/home_bloc.dart';
import '../../state/home/home_event.dart';
import '../../state/home/home_state.dart';

class SortSection extends StatelessWidget {
  const SortSection({super.key});

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
                  _SortButton(
                    width: 160,
                    label: 'Precio: Menor',
                    icon: Icons.arrow_upward,
                    isSelected: state.sortBy == SortBy.priceAsc,
                    onPressed: () {
                      context.read<HomesBloc>().add(
                        HomesChangeSortBy(
                          state.sortBy == SortBy.priceAsc ? null : SortBy.priceAsc,
                        ),
                      );
                    },
                  ),
                  _SortButton(
                    width: 160,
                    label: 'Precio: Mayor',
                    icon: Icons.arrow_downward,
                    isSelected: state.sortBy == SortBy.priceDesc,
                    onPressed: () {
                      context.read<HomesBloc>().add(
                        HomesChangeSortBy(
                          state.sortBy == SortBy.priceDesc ? null : SortBy.priceDesc,
                        ),
                      );
                    },
                  ),
                  _SortButton(
                    width: 120,
                    label: 'Ciudad',
                    icon: Icons.location_city,
                    isSelected: state.sortBy == SortBy.city,
                    separation: 14,
                    onPressed: () {
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

class _SortButton extends StatelessWidget {
  const _SortButton({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onPressed,
    required this.width,
    this.separation = 4,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onPressed;
  final double width;
  final double separation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 32,
      child: RippleRevealButton(
        radius: 12,
        widgetA: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: theme.sText,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: separation),
            Icon(
              icon,
              color: theme.sText,
              size: 18,
            ),
          ],
        ),
        widgetB: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: theme.text,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: separation),
            Icon(
              icon,
              color: theme.text,
              size: 18,
            ),
          ],
        ),
        backgroundColorA: theme.bgDark,
        backgroundColorB: theme.primary,
        rippleColorA: theme.primary,
        rippleColorB: theme.bgDark,
        border: BoxBorder.all(
          color: isSelected ? theme.primary : theme.border,
          width: isSelected ? 1.8 : 1.5,
        ),
        duration: const Duration(milliseconds: 300),
        selected: isSelected,
        onPressed: onPressed,
      ),
    );
  }
}
