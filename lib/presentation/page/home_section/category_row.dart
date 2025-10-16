import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_motionly/widget/button/ripple_reveal_button.dart';
import 'package:home_mock/core/localization/app_locale.dart';
import 'package:home_mock/core/utils/feedback.dart';
import 'package:home_mock/model/entity/settings.dart';
import 'package:home_mock/presentation/state/settings/settings_bloc.dart';

import '../../../core/constants/app_durations.dart';
import '../../../core/constants/app_radius.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/locator.dart';
import '../../../model/entity/item.dart';
import '../../state/home/home_bloc.dart';
import '../../state/home/home_event.dart';

class CategoryRow extends StatelessWidget {
  const CategoryRow({
    super.key,
    this.selected,
  });

  final Category? selected;

  @override
  Widget build(BuildContext context) {
    final entries = [
      (Category.apartment, '🏢', context.l10n.apartment),
      (Category.house, '🏠', context.l10n.house),
    ];
    final bloc = context.read<HomesBloc>();

    return SizedBox(
      height: 140,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 4),
        children: [
          FadeInLeft(
            duration: AppDurations.medium,
            child: _CategoryChip(
              active: selected == Category.apartment,
              icon: entries[0].$2,
              label: entries[0].$3,
              width: context.read<SettingsBloc>().state.language == AppLanguage.en ? 100 : 120,
              onTap: () => select(() => bloc.add(HomesChangeCategory(Category.apartment))).call(),
              onDeselect: () => click(() => bloc.add(HomesChangeCategory(Category.all))).call(),
            ),
          ),
          FadeInLeft(
            delay: AppDurations.fast,
            duration: AppDurations.medium,
            child: _CategoryChip(
              active: selected == Category.house,
              icon: entries[1].$2,
              label: entries[1].$3,
              onTap: () => select(() => bloc.add(HomesChangeCategory(Category.house))).call(),
              onDeselect: () => click(() => bloc.add(HomesChangeCategory(Category.all))).call(),
            ),
          ),
          FadeInLeft(
            delay: AppDurations.slow,
            duration: AppDurations.medium,
            child: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: AppRadius.borderHuge,
                  color: theme.bg,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    overlayColor: theme.primary,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: AppRadius.borderHuge,
                    ),
                  ),
                  onPressed: select(() {
                    bloc.add(HomesChangeCategory(Category.all));
                  }),
                  child: Text(
                    context.l10n.all,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: theme.textMuted,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
    required this.active,
    required this.icon,
    required this.label,
    required this.onTap,
    required this.onDeselect,
    this.width = 100,
  });

  final bool active;
  final String icon;
  final String label;
  final VoidCallback onTap;
  final VoidCallback onDeselect;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: SizedBox(
        width: width,
        height: 140,
        child: RippleRevealButton(
          height: 140,
          duration: AppDurations.medium,
          alignment: AlignmentGeometry.center,
          widgetA: Padding(
            padding: AppSpacing.verticalXl,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: theme.sBgDark.withOpacity(0.3),
                        blurRadius: 16,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Text(
                    icon,
                    style: const TextStyle(fontSize: 42),
                  ),
                ),
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: theme.text,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          widgetB: Padding(
            padding: AppSpacing.verticalXl,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: theme.sBgDark.withOpacity(0.25),
                        blurRadius: 16,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Text(
                    icon,
                    style: const TextStyle(fontSize: 42),
                  ),
                ),
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: theme.sText,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          backgroundColorA: theme.primary,
          backgroundColorB: theme.bg,
          radius: 24,
          rippleColorA: theme.bg,
          rippleColorB: theme.primary,
          selected: !active,
          onPressed: () {
            if (active) {
              onDeselect();
            } else {
              onTap();
            }
          },
        ),
      ),
    );
  }
}
