import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_motionly/widget/button/ripple_reveal_button.dart';
import 'package:home_mock/presentation/state/home/home_bloc.dart';
import 'package:home_mock/presentation/widget/like_button.dart';

import '../../core/locator.dart';
import '../../model/entity/item.dart';
import '../state/home/home_state.dart';
import '../widget/cached_image.dart';

class DetailsPage extends StatelessWidget {
  final String itemId;

  const DetailsPage({super.key, required this.itemId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomesBloc, HomesState>(
      builder: (context, state) {
        Item item = state.items.firstWhere((e) => e.id == itemId);
        var sizeData = item.size.split(' ');
        return Scaffold(
          backgroundColor: theme.bgDark,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
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
                          _circleButton(
                            context,
                            icon: Icons.arrow_back_ios_new_rounded,
                            onTap: () => Navigator.pop(context),
                          ),
                          const Expanded(child: SizedBox()),
                          Row(
                            children: [
                              SizedBox(
                                width: 36,
                                child: LikeButton(item: item),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    Icon(Icons.location_on_outlined, size: 16, color: theme.textMuted),
                                    const SizedBox(width: 4),
                                    Text(item.city, style: TextStyle(color: theme.textMuted)),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              spacing: 8,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(color: theme.primary.withAlpha(51), borderRadius: BorderRadius.circular(8)),
                                  child: Text(
                                    "From next month",
                                    style: TextStyle(color: theme.primary),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: theme.warning, size: 18),
                                    const SizedBox(width: 4),
                                    Text("5.0 (18 reviews)", style: TextStyle(color: theme.textMuted)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _FeatureCard(
                              icon: Icons.square_foot_rounded,
                              value: sizeData[0],
                              label: sizeData[1],
                            ),
                            _FeatureCard(
                              icon: Icons.bed_rounded,
                              value: "${item.bedrooms}",
                              label: "Bedrooms",
                            ),
                            _FeatureCard(
                              icon: Icons.bathtub_rounded,
                              value: "${item.bathrooms}",
                              label: "Bathrooms",
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: theme.bgLight,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 24,
                                backgroundImage: NetworkImage(item.owner.avatarUrl),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  item.owner.name,
                                  style: TextStyle(color: theme.text, fontWeight: FontWeight.w600),
                                ),
                              ),
                              Row(
                                children: [
                                  _circleButton(context, icon: Icons.chat_bubble_outline),
                                  const SizedBox(width: 10),
                                  _circleButton(context, icon: Icons.call_outlined),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Description',
                              style: TextStyle(color: theme.text, fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item.description,
                              style: TextStyle(color: theme.text, height: 1.5, fontSize: 14),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 110),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomSheet: Container(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              bottom: 16,
              top: 10,
            ),
            height: 90,
            decoration: BoxDecoration(
              color: theme.bgLight,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
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
                        color: theme.textMuted,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "\$${item.price}/m",
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
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  onPressed: () {},
                  child: const Text('Buy Now', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _circleButton(BuildContext context, {required IconData icon, VoidCallback? onTap, Color? color}) {
    return SizedBox(
      width: 36,
      child: RippleRevealButton(
        widgetA: Center(child: Icon(icon, color: color ?? theme.text, size: 18)),
        widgetB: Center(child: Icon(icon, color: color ?? theme.text, size: 18)),
        height: 36,
        padding: EdgeInsets.zero,
        selected: color == Colors.red,
        backgroundColorA: !context.read<HomesBloc>().state.isDarkMode ? theme.bgDark : theme.bgDark.withAlpha(120),
        backgroundColorB: !context.read<HomesBloc>().state.isDarkMode ? theme.bgDark.withAlpha(254) : theme.bgDark.withAlpha(121),
        rippleColorA: theme.warning.withAlpha(300),
        rippleColorB: theme.bgDark.withAlpha(31),
        radius: 32,
        duration: const Duration(milliseconds: 200),
        onPressed: onTap ?? () {},
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String value, label;

  const _FeatureCard({required this.icon, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: theme.bgLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, color: theme.text, size: 24),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(color: theme.text, fontWeight: FontWeight.bold),
          ),
          Text(label, style: TextStyle(color: theme.textMuted, fontSize: 12)),
        ],
      ),
    );
  }
}
