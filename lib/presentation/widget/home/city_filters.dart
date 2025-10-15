import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/locator.dart';
import '../../state/home/home_bloc.dart';
import '../../state/home/home_event.dart';
import '../../state/home/home_state.dart';

class CityFilters extends StatelessWidget {
  const CityFilters({super.key});

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
