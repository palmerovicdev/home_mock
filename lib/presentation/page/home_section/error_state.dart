import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_motionly/widget/button/pulsating_button.dart';
import 'package:home_mock/core/localization/app_locale.dart';
import 'package:home_mock/core/utils/feedback.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constants/app_spacing.dart';
import '../../../core/locator.dart';
import '../../../gen/assets.gen.dart';
import '../../state/home/home_bloc.dart';
import '../../state/home/home_event.dart';

class ErrorState extends StatelessWidget {
  const ErrorState({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Lottie.asset(
            Assets.animations.failed,
            width: 200,
            height: 200,
            fit: BoxFit.cover,
            repeat: true,
          ),
          AppSpacing.gapLg,
          Text(
            context.l10n.oopsSomethingWentWrong,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: theme.text,
            ),
            textAlign: TextAlign.center,
          ),
          AppSpacing.gapMd,
          Text(
            context.l10n.couldNotLoadProperties,
            style: TextStyle(
              color: theme.textMuted,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          AppSpacing.gapExtraLarge,
          SizedBox(
            height: 50,
            width: 180,
            child: PulsatingButton(
              height: 40,
              width: 160,
              color: theme.primary,
              onClick: select(() {
                context.read<HomesBloc>().add(HomesRetryLoad());
              }),
              child: Text(
                context.l10n.retry,
                style: TextStyle(
                  color: theme.bgLight,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
