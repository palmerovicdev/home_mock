import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_motionly/widget/button/ripple_reveal_button.dart';
import 'package:home_mock/core/localization/app_locale.dart';
import 'package:home_mock/core/utils/feedback.dart';

import '../../../core/locator.dart';
import '../../state/home/home_bloc.dart';
import '../../state/home/home_event.dart';
import '../../state/home/home_state.dart';

class CityFilters extends StatefulWidget {
  const CityFilters({super.key});

  @override
  State<CityFilters> createState() => _CityFiltersState();
}

class _CityFiltersState extends State<CityFilters> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomesBloc, HomesState>(
      buildWhen: (p, c) => p.selectedCities != c.selectedCities || p.availableCities != c.availableCities,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.filterByCity,
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
                  return SizedBox(
                    height: 32,
                    width: 120,
                    child: RippleRevealButton(
                      selected: isSelected,
                      border: isSelected ? Border.all(color: theme.primary, width: 1.8) : Border.all(color: theme.border, width: 1.5),
                      onPressed: () => click(() {
                        context.read<HomesBloc>().add(
                          HomesToggleCityFilter(city),
                        );
                      }),
                      radius: 12,
                      widgetA: Text(
                        city,
                        style: TextStyle(
                          color: theme.sText,
                        ),
                      ),
                      widgetB: Text(
                        city,
                        style: TextStyle(
                          color: theme.text,
                        ),
                      ),
                      duration: const Duration(milliseconds: 300),
                      backgroundColorA: theme.bgDark,
                      backgroundColorB: theme.primary,
                      rippleColorA: theme.primary,
                      rippleColorB: theme.bgDark,
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
