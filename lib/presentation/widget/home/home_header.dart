import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/locator.dart';
import '../../state/home/home_bloc.dart';
import '../../state/home/home_event.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(
                  'https://i.pravatar.cc/100',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Hi, You',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: theme.text,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  context.read<HomesBloc>().add(HomesToggleTheme());
                },
                icon: Icon(
                  context.read<HomesBloc>().state.isDarkMode
                      ? Icons.light_mode
                      : Icons.dark_mode,
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
  }
}
