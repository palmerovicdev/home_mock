import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_motionly/widget/button/ripple_reveal_button.dart';

import '../../../core/locator.dart';
import '../../../model/entity/item.dart';
import '../../state/home/home_bloc.dart';
import '../../state/home/home_event.dart';

class CategoryRow extends StatelessWidget {
  const CategoryRow({
    super.key,
    this.selected,
  });

  final Category? selected;

  @override
  Widget build(BuildContext context) {
    final entries = const [
      (Category.apartment, Icons.apartment, 'Apartment'),
      (Category.house, Icons.house_rounded, 'House'),
    ];
    final bloc = context.read<HomesBloc>();

    return SizedBox(
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 4),
        children: [
          FadeInLeft(
            duration: const Duration(milliseconds: 400),
            child: _CategoryChip(
              active: selected == Category.apartment,
              icon: entries[0].$2,
              label: entries[0].$3,
              onTap: () => bloc.add(HomesChangeCategory(Category.apartment)),
              onDeselect: () => bloc.add(HomesChangeCategory(Category.all)),
            ),
          ),
          FadeInLeft(
            delay: const Duration(milliseconds: 400),
            duration: const Duration(milliseconds: 400),
            child: _CategoryChip(
              active: selected == Category.house,
              icon: entries[1].$2,
              label: entries[1].$3,
              onTap: () => bloc.add(HomesChangeCategory(Category.house)),
              onDeselect: () => bloc.add(HomesChangeCategory(Category.all)),
            ),
          ),
          FadeInLeft(
            delay: const Duration(milliseconds: 800),
            duration: const Duration(milliseconds: 400),
            child: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: TextButton(
                onPressed: () => bloc.add(HomesChangeCategory(Category.all)),
                child: Text(
                  'All',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: theme.textMuted,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
    required this.active,
    required this.icon,
    required this.label,
    required this.onTap,
    required this.onDeselect,
  });

  final bool active;
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final VoidCallback onDeselect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: SizedBox(
        width: 140,
        child: RippleRevealButton(
          duration: Duration(milliseconds: 300),
          height: 60,
          alignment: AlignmentGeometry.center,
          widgetA: Row(
            spacing: 8,
            children: [
              Icon(icon, color: theme.text),
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: theme.text,
                ),
              ),
            ],
          ),
          widgetB: Row(
            spacing: 8,
            children: [
              Icon(icon, color: theme.bgDark),
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: theme.bgDark,
                ),
              ),
            ],
          ),
          backgroundColorA: theme.primary,
          backgroundColorB: theme.bgDark,
          radius: 24,
          rippleColorA: theme.bgDark,
          rippleColorB: theme.primary,
          selected: !active,
          onPressed: () {
            if (active) {
              onDeselect();
            } else {
              onTap();
            }
          },
        ),
      ),
    );
  }
}
