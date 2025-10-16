import 'package:flutter/material.dart';
import 'package:home_mock/core/locator.dart';
import 'package:home_mock/presentation/widget/details/price_bottom_sheet.dart';
import 'package:screen_corner_radius/screen_corner_radius.dart';

import '../../../core/constants/app_spacing.dart';
import '../../../core/utils/feedback.dart';
import '../../../model/entity/item.dart';
import '../../widget/cached_image.dart';
import '../../widget/like_button.dart';

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
        Padding(
          padding: AppSpacing.paddingXs,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(locator.get<ScreenRadius>().topLeft - 4),
                topRight: Radius.circular(locator.get<ScreenRadius>().topRight - 4),
                bottomLeft: Radius.circular(locator.get<ScreenRadius>().bottomLeft - 24),
                bottomRight: Radius.circular(locator.get<ScreenRadius>().bottomRight - 24),
              ),
            ),
            child: Hero(
              tag: 'home_${item.id}',
              child: CachedImage(
                imageUrl: item.imageUrl,
                height: 380,
                width: double.infinity,
                fit: BoxFit.cover,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(locator.get<ScreenRadius>().topLeft - 4),
                  topRight: Radius.circular(locator.get<ScreenRadius>().topRight - 4),
                  bottomLeft: Radius.circular(locator.get<ScreenRadius>().bottomLeft - 24),
                  bottomRight: Radius.circular(locator.get<ScreenRadius>().bottomRight - 24),
                ),
              ),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: AppSpacing.horizontalExtraLarge,
            child: Row(
              children: [
                CircleButton(
                  icon: Icons.arrow_back_ios_new_rounded,
                  onTap: click(() => Navigator.pop(context)),
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
