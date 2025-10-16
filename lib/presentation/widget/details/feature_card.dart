import 'package:flutter/material.dart';
import 'package:home_mock/core/constants/app_spacing.dart';

import '../../../core/constants/app_radius.dart';
import '../../../core/locator.dart';

class FeatureCard extends StatelessWidget {
  const FeatureCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  final String icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      padding: AppSpacing.verticalXl,
      decoration: BoxDecoration(
        color: theme.bg,
        borderRadius: AppRadius.borderXxl,
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: theme.sBgDark.withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Text(
              icon,
              style: const TextStyle(fontSize: 28),
            ),
          ),
          AppSpacing.gapSm,
          Text(
            value,
            style: TextStyle(
              color: theme.text,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: theme.textMuted,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
