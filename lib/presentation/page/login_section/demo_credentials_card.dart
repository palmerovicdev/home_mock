import 'package:flutter/material.dart';
import 'package:home_mock/core/constants/app_radius.dart';

import '../../../core/constants/app_spacing.dart';
import '../../../core/locator.dart';

class DemoCredentialsCard extends StatelessWidget {
  const DemoCredentialsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSpacing.paddingXxl,
      decoration: BoxDecoration(
        color: theme.bgLight,
        borderRadius: AppRadius.borderXxl,
        border: Border.all(color: theme.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.info_outline,
                size: 20,
                color: theme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'Demo Credentials',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: theme.text,
                ),
              ),
            ],
          ),
          AppSpacing.gapMd,
          Text(
            'Email: test@gmail.com\nPassword: 123456',
            style: TextStyle(
              fontSize: 13,
              color: theme.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}
