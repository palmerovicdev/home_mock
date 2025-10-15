import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                  SortChip(
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
                  SortChip(
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
                  SortChip(
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

class SortChip extends StatelessWidget {
  const SortChip({
    super.key,
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
