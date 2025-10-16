import 'package:flutter/material.dart';
import 'package:home_mock/core/localization/app_locale.dart';

import '../../../model/entity/item.dart';
import '../../widget/details/feature_card.dart';

class PropertyFeatures extends StatelessWidget {
  const PropertyFeatures({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    final sizeData = item.size.split(' ');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FeatureCard(
            icon: '📐',
            value: sizeData[0],
            label: sizeData[1],
          ),
          FeatureCard(
            icon: '🛌',
            value: "${item.bedrooms}",
            label: context.l10n.bedrooms,
          ),
          FeatureCard(
            icon: '🛁',
            value: "${item.bathrooms}",
            label: context.l10n.bathrooms,
          ),
        ],
      ),
    );
  }
}
