import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_motionly/widget/button/ripple_reveal_button.dart';
import 'package:home_mock/core/localization/app_locale.dart';
import 'package:home_mock/model/entity/settings.dart';
import 'package:home_mock/presentation/state/settings/settings_bloc.dart';

import '../../../core/locator.dart';
import '../../../core/utils/feedback.dart';
import '../../state/home/home_bloc.dart';
import '../../state/home/home_event.dart';
import '../../state/home/home_state.dart';

class SortSection extends StatelessWidget {
  const SortSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomesBloc, HomesState>(
      builder: (context, state) {
        var isEn = context.read<SettingsBloc>().state.language == AppLanguage.en;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.sortBy,
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
                    width: isEn ? 165 : 190,
                    label: context.l10n.priceAscending,
                    icon: Icons.arrow_upward,
                    isSelected: state.sortBy == SortBy.priceAsc,
                    onPressed: click(() {
                      context.read<HomesBloc>().add(
                        HomesChangeSortBy(
                          state.sortBy == SortBy.priceAsc ? null : SortBy.priceAsc,
                        ),
                      );
                    }),
                  ),
                  _SortButton(
                    width: isEn ? 175 : 190,
                    label: context.l10n.priceDescending,
                    icon: Icons.arrow_downward,
                    isSelected: state.sortBy == SortBy.priceDesc,
                    onPressed: click(() {
                      context.read<HomesBloc>().add(
                        HomesChangeSortBy(
                          state.sortBy == SortBy.priceDesc ? null : SortBy.priceDesc,
                        ),
                      );
                    }),
                  ),
                  _SortButton(
                    width: isEn ? 90 : 110,
                    label: context.l10n.city,
                    icon: Icons.location_city,
                    isSelected: state.sortBy == SortBy.city,
                    separation: 14,
                    onPressed: click(() {
                      context.read<HomesBloc>().add(
                        HomesChangeSortBy(
                          state.sortBy == SortBy.city ? null : SortBy.city,
                        ),
                      );
                    }),
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
                fontSize: 13,
                color: theme.sText,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: separation),
            Icon(
              icon,
              color: theme.sText,
              size: 16,
            ),
          ],
        ),
        widgetB: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                color: theme.text,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: separation),
            Icon(
              icon,
              color: theme.text,
              size: 16,
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
