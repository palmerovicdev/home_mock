import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_motionly/widget/button/ripple_reveal_button.dart';
import 'package:lottie/lottie.dart';

import '../../core/locator.dart';
import '../../core/utils/feedback.dart';
import '../../gen/assets.gen.dart';
import '../../model/entity/item.dart';
import '../state/home/home_bloc.dart';
import '../state/home/home_event.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key, required this.item});

  final Item item;

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  @override
  Widget build(BuildContext context) {
    return RippleRevealButton(
      widgetB: Center(
        child: Icon(
          widget.item.isFavorite ? Icons.favorite : Icons.favorite_border,
          size: 18,
          color: widget.item.isFavorite ? Colors.redAccent : theme.textMuted,
        ),
      ),
      widgetA: Center(
        child: Lottie.asset(
          Assets.animations.like,
          animate: true,
          repeat: false,
          width: 50,
          height: 50,
          frameRate: FrameRate(140),
        ),
      ),
      height: 36,
      padding: EdgeInsets.zero,
      selected: widget.item.isFavorite,
      backgroundColorA: theme.bgDark.withAlpha(150),
      backgroundColorB: theme.bgDark.withAlpha(151),
      rippleColorA: theme.warning.withAlpha(300),
      rippleColorB: theme.bgDark.withAlpha(31),
      radius: 32,
      duration: const Duration(milliseconds: 200),
      onPressed: click(
        () {
          context.read<HomesBloc>().add(
            HomesChangeFavorite(
              widget.item.copyWith(
                isFavorite: !widget.item.isFavorite,
              ),
            ),
          );
        },
      ),
    );
  }
}
