import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:home_mock/core/localization/app_locale.dart';
import 'package:home_mock/presentation/page/setting_section/profile_section.dart';
import 'package:home_mock/presentation/page/setting_section/settings_section.dart';

import '../../core/locator.dart';
import '../state/settings/settings_bloc.dart';
import '../state/settings/settings_state.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: theme.bgDark,
          appBar: AppBar(
            backgroundColor: theme.bgDark,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: theme.text),
              onPressed: () => context.pop(),
            ),
            title: Text(
              context.l10n.settings,
              style: TextStyle(
                color: theme.text,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ProfileSection(user: state.user),
                const SizedBox(height: 16),
                SettingsSection(state: state),
              ],
            ),
          ),
        );
      },
    );
  }
}
