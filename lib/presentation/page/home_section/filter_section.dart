import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/locator.dart';
import '../../state/home/home_bloc.dart';
import '../../state/home/home_event.dart';
import '../../state/home/home_state.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({
    super.key,
    required this.showFilters,
  });

  final bool showFilters;

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
            ],
          ),
        );
      },
    );
  }
}
