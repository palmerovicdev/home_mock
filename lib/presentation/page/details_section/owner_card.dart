import 'package:flutter/material.dart';
import 'package:home_mock/presentation/widget/details/price_bottom_sheet.dart';

import '../../../core/constants/app_radius.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/locator.dart';
import '../../../model/entity/owner.dart';

class OwnerCard extends StatelessWidget {
  const OwnerCard({
    super.key,
    required this.owner,
  });

  final Owner owner;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.horizontalHuge,
      child: Container(
        decoration: BoxDecoration(
          color: theme.bg,
          borderRadius: AppRadius.borderCircular,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(owner.avatarUrl),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                owner.name,
                style: TextStyle(
                  color: theme.text,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Row(
              children: [
                CircleButton(
                  icon: Icons.chat_bubble_outline,
                  size: 52,
                  color: theme.primary,
                ),
                const SizedBox(width: 10),
                CircleButton(
                  icon: Icons.call_outlined,
                  size: 52,
                  color: theme.primary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
