import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_motionly/widget/button/ripple_reveal_button.dart';

import '../../../core/locator.dart';
import '../../state/home/home_bloc.dart';

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
        color: theme.bgLight,
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
                'Price',
                style: TextStyle(
                  color: theme.text,
                  fontSize: 14,
                ),
              ),
              Text(
                "\$$price/m",
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
            onPressed: () {},
            child: const Text(
              'Buy Now',
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
  });

  final IconData icon;
  final VoidCallback? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<HomesBloc>().state.isDarkMode;

    return SizedBox(
      width: 36,
      height: 36,
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
        backgroundColorB: !isDark ? theme.bgDark.withAlpha(254) : theme.bgDark.withAlpha(121),
        rippleColorA: theme.warning.withAlpha(300),
        rippleColorB: theme.bgDark.withAlpha(31),
        radius: 32,
        duration: const Duration(milliseconds: 200),
        onPressed: onTap ?? () {},
      ),
    );
  }
}
