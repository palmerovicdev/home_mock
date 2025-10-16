import 'package:flutter/material.dart';
import 'package:home_mock/core/localization/app_locale.dart';

import '../../../core/constants/app_radius.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/locator.dart';
import '../../../model/entity/item.dart';

class PropertyTitleSection extends StatelessWidget {
  const PropertyTitleSection({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.horizontalHuge,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: TextStyle(
                  color: theme.text,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              AppSpacing.gapSm,
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 16,
                    color: theme.textMuted,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    item.city,
                    style: TextStyle(color: theme.textMuted),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 8,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: theme.primary.withAlpha(51),
                  borderRadius: AppRadius.borderMd,
                ),
                child: Text(
                  context.l10n.fromNextMonth,
                  style: TextStyle(color: theme.primary),
                ),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: theme.warning, size: 18),
                  const SizedBox(width: 4),
                  Text(
                    "5.0 (18 ${context.l10n.reviews})",
                    style: TextStyle(color: theme.textMuted),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
