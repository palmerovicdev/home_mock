import 'package:flutter/material.dart';
import 'package:home_mock/presentation/widget/details/price_bottom_sheet.dart';

import '../../../model/entity/item.dart';
import '../cached_image.dart';
import '../like_button.dart';

class PropertyHeader extends StatelessWidget {
  const PropertyHeader({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: 'home_${item.id}',
          child: CachedImage(
            imageUrl: item.imageUrl,
            height: 350,
            width: double.infinity,
            fit: BoxFit.cover,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(32),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                CircleButton(
                  icon: Icons.arrow_back_ios_new_rounded,
                  onTap: () => Navigator.pop(context),
                ),
                const Expanded(child: SizedBox()),
                SizedBox(
                  width: 36,
                  child: LikeButton(item: item),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
