import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:home_mock/core/localization/app_locale.dart';
import 'package:home_mock/core/utils/feedback.dart';

import '../../../core/locator.dart';
import '../../../core/router/routes.dart';
import '../../state/settings/settings_bloc.dart';
import '../../state/settings/settings_state.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, settingsState) {
        final user = settingsState.user;

        return LayoutBuilder(
          builder: (context, constraints) {
            final isCompact = constraints.maxHeight < 140;

            return Padding(
              padding: EdgeInsets.all(isCompact ? 12.0 : 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: click(() => context.pushNamed(Routes.settings.name)),
                        child: CircleAvatar(
                          radius: isCompact ? 20.0 : 24.0,
                          backgroundImage: CachedNetworkImageProvider(
                            user?.avatarUrl ?? 'https://i.pravatar.cc/100',
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              context.l10n.hello(user?.name ?? "Usuario"),
                              style: TextStyle(
                                fontSize: isCompact ? 14.0 : 16.0,
                                fontWeight: FontWeight.w600,
                                color: theme.sText,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (!isCompact)
                              Row(
                                children: [
                                  Icon(
                                    Icons.mail,
                                    size: 14,
                                    color: theme.sTextMuted,
                                  ),
                                  const SizedBox(width: 4),
                                  Flexible(
                                    child: Text(
                                      user?.email ?? 'testing@gmail.com',
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        color: theme.sTextMuted,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: click(() => context.pushNamed(Routes.settings.name)),
                        icon: Icon(
                          Icons.settings_outlined,
                          color: theme.sText,
                          size: 22,
                        ),
                      ),
                    ],
                  ),
                  if (!isCompact) ...[
                    const SizedBox(height: 8),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: context.l10n.buyYour,
                            style: TextStyle(
                              fontSize: 28.0,
                              color: theme.sTextMuted,
                            ),
                          ),
                          TextSpan(
                            text: '\n${context.l10n.perfectHome}',
                            style: TextStyle(
                              fontSize: 32.0,
                              fontWeight: FontWeight.w700,
                              color: theme.sText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            );
          },
        );
      },
    );
  }
}
