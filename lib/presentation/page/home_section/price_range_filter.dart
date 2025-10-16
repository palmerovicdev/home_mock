import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_mock/core/localization/app_locale.dart';

import '../../../core/locator.dart';
import '../../state/home/home_bloc.dart';
import '../../state/home/home_event.dart';
import '../../state/home/home_state.dart';

class PriceRangeFilter extends StatelessWidget {
  const PriceRangeFilter({super.key});

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
                context.l10n.priceRange,
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
