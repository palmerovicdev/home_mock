import 'package:flutter/material.dart';
import 'package:home_mock/core/localization/app_locale.dart';

import '../../../core/constants/app_spacing.dart';
import '../../../core/locator.dart';

class PropertyDescription extends StatelessWidget {
  const PropertyDescription({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.horizontalHuge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.description,
            style: TextStyle(
              color: theme.text,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          AppSpacing.gapMd,
          Text(
            description,
            style: TextStyle(
              color: theme.text,
              height: 1.5,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
