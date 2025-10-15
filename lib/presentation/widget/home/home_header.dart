import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => context.pushNamed(Routes.settings.name),
                    child: CircleAvatar(
                      radius: 18,
                      backgroundImage: NetworkImage(
                        user?.avatarUrl ?? 'https://i.pravatar.cc/100',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Hola, ${user?.name ?? "Usuario"}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: theme.text,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => context.pushNamed(Routes.settings.name),
                    icon: Icon(
                      Icons.settings_outlined,
                      color: theme.text,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Buy Your\n',
                      style: TextStyle(
                        fontSize: 22,
                        color: theme.textMuted,
                      ),
                    ),
                    TextSpan(
                      text: 'Perfect Home 🏠',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: theme.text,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
