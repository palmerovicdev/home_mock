import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_motionly/widget/button/ripple_reveal_button.dart';
import 'package:home_mock/core/localization/app_locale.dart';
import 'package:home_mock/presentation/state/settings/settings_bloc.dart';

import '../../../core/constants/app_radius.dart';
import '../../../core/locator.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../core/utils/feedback.dart';

class PriceBottomSheet extends StatelessWidget {
  const PriceBottomSheet({
    super.key,
    required this.price,
  });

  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: 16,
        top: 10,
      ),
      height: 90,
      decoration: BoxDecoration(
        color: theme.bgDark,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: theme.borderMuted.withAlpha(60),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.price,
                style: TextStyle(
                  color: theme.text,
                  fontSize: 14,
                ),
              ),
              Text(
                CurrencyFormatter.formatWithSuffix(
                  price.toDouble(),
                  currency: context.read<SettingsBloc>().state.currency,
                ),
                style: TextStyle(
                  color: theme.text,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.primary,
              foregroundColor: theme.bgDark,
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 14,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            onPressed: click(() {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    context.l10n.purchaseInProgress,
                    style: TextStyle(
                      color: theme.bgDark,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  duration: const Duration(seconds: 2),
                  backgroundColor: theme.primary,
                ),
              );
            }),
            child: Text(
              context.l10n.buyNow,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
    required this.icon,
    this.onTap,
    this.color,
    this.size = 36,
  });

  final IconData icon;
  final VoidCallback? onTap;
  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<SettingsBloc>().state.isDarkMode;

    return SizedBox(
      width: size,
      height: size,
      child: RippleRevealButton(
        widgetA: Center(
          child: Icon(icon, color: color ?? theme.text, size: 18),
        ),
        widgetB: Center(
          child: Icon(icon, color: color ?? theme.text, size: 18),
        ),
        padding: EdgeInsets.zero,
        selected: color == Colors.red,
        backgroundColorA: !isDark ? theme.bgDark : theme.bgDark.withAlpha(120),
        backgroundColorB: !isDark
            ? theme.bgDark.withAlpha(254)
            : theme.bgDark.withAlpha(121),
        rippleColorA: theme.warning.withAlpha(300),
        rippleColorB: theme.bgDark.withAlpha(31),
        radius: AppRadius.circular,
        duration: const Duration(milliseconds: 200),
        onPressed: onTap ?? () {},
      ),
    );
  }
}
