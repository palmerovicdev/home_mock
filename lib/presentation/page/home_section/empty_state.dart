import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_motionly/widget/button/pulsating_button.dart';
import 'package:home_mock/core/localization/app_locale.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constants/app_radius.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/locator.dart';
import '../../../core/utils/feedback.dart';
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
    return Column(
      children: [
        Lottie.asset(
          Assets.animations.info,
          width: 240,
          height: 240,
          fit: BoxFit.cover,
          repeat: true,
        ),
        AppSpacing.gapLg,
        Text(
          context.l10n.noResultsFound,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: theme.text,
          ),
          textAlign: TextAlign.center,
        ),
        AppSpacing.gapMd,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Text(
            hasActiveFilters ? context.l10n.tryAdjustingFilters : context.l10n.thereAreNoPropertiesRightNow,
            style: TextStyle(
              color: theme.textMuted,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        if (hasActiveFilters) ...[
          AppSpacing.gapLg,
          SizedBox(
            height: 50,
            width: 180,
            child: Center(
              child: PulsatingButton(
                height: 40,
                width: 160,
                onClick: select(() {
                  context.read<HomesBloc>().add(HomesClearFilters());
                }),
                color: theme.primary,
                borderRadius: AppRadius.borderLg,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.clear_all, color: theme.bgDark),
                    Text(
                      context.l10n.clearFilters,
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
    );
  }
}
