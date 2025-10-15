import 'package:flutter/material.dart';

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
            icon: Icons.square_foot_rounded,
            value: sizeData[0],
            label: sizeData[1],
          ),
          FeatureCard(
            icon: Icons.bed_rounded,
            value: "${item.bedrooms}",
            label: "Bedrooms",
          ),
          FeatureCard(
            icon: Icons.bathtub_rounded,
            value: "${item.bathrooms}",
            label: "Bathrooms",
          ),
        ],
      ),
    );
  }
}
