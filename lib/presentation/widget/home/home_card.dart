import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/locator.dart';
import '../../../core/router/routes.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../core/utils/feedback.dart';
import '../../../model/entity/item.dart';
import '../../state/home/home_bloc.dart';
import '../../state/settings/settings_bloc.dart';
import '../../state/settings/settings_state.dart';
import '../cached_image.dart';
import '../like_button.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, settingsState) {
        final price = CurrencyFormatter.formatWithSuffix(
          item.price.toDouble(),
          currency: settingsState.currency,
        );
        return ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: GestureDetector(
            onTap: click(() {
              HapticFeedback.lightImpact();
              context.pushNamed(Routes.details.name, extra: item.id);
            }),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Hero(
                  tag: 'home_${item.id}',
                  child: CachedImage(
                    imageUrl: item.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                context.read<HomesBloc>().state.isDarkMode
                    ? DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, theme.bgDark],
                            stops: [0.4, 1.0],
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                Positioned(
                  left: 8,
                  right: 8,
                  bottom: 12,
                  child: HomeCardInfo(
                    title: item.title,
                    city: item.city,
                    price: price,
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: SizedBox(
                    width: 36,
                    child: LikeButton(item: item),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class HomeCardInfo extends StatelessWidget {
  const HomeCardInfo({
    super.key,
    required this.title,
    required this.city,
    required this.price,
  });

  final String title, city, price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
        color: context.read<HomesBloc>().state.isDarkMode ? theme.bgLight.withAlpha(180) : theme.bgDark,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: theme.text,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 12,
                color: theme.textMuted,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  city,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: theme.textMuted, fontSize: 12),
                ),
              ),
            ],
          ),
          Text(
            price,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: theme.text,
            ),
          ),
        ],
      ),
    );
  }
}
