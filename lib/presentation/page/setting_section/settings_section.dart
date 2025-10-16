import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_mock/core/constants/app_radius.dart';
import 'package:home_mock/core/constants/app_spacing.dart';
import 'package:home_mock/core/localization/app_locale.dart';

import '../../../core/constants/app_durations.dart';
import '../../../core/locator.dart';
import '../../../core/utils/feedback.dart';
import '../../../model/entity/settings.dart';
import '../../state/settings/settings_bloc.dart';
import '../../state/settings/settings_event.dart';
import '../../state/settings/settings_state.dart';
import '../../widget/settings/settings_group.dart';
import '../../widget/settings/settings_title.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({
    super.key,
    required this.state,
  });

  final SettingsState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingsGroup(
          title: context.l10n.appearance,
          children: [
            SettingsTile(
              icon: Icons.palette_outlined,
              title: context.l10n.theme,
              subtitle: state.themeMode.displayName,
              onTap: click(() {
                _showThemeDialog(context, state.themeMode);
              }),
            ),
          ],
        ),
        SettingsGroup(
          title: context.l10n.localization,
          children: [
            SettingsTile(
              icon: Icons.language_outlined,
              title: context.l10n.language,
              subtitle: state.language.displayName,
              onTap: click(() {
                _showLanguageDialog(context, state.language);
              }),
            ),
            SettingsTile(
              icon: Icons.attach_money_outlined,
              title: context.l10n.currency,
              subtitle: state.currency.displayName,
              onTap: click(() {
                _showCurrencyDialog(context, state.currency);
              }),
            ),
          ],
        ),
        SettingsGroup(
          title: context.l10n.data,
          children: [
            SettingsTile(
              icon: Icons.cleaning_services_outlined,
              title: context.l10n.clearCache,
              subtitle: context.l10n.clearCacheDescription,
              onTap: click(() {
                _showClearCacheDialog(context);
              }),
            ),
          ],
        ),
        AppSpacing.gapMassive,
      ],
    );
  }

  void _showThemeDialog(BuildContext context, AppThemeMode currentTheme) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: theme.bgLight,
        title: Text(
          context.l10n.selectTheme,
          style: TextStyle(color: theme.text),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 6,
          children: AppThemeMode.values.map((mode) {
            return SizedBox(
              width: 200,
              height: 40,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: currentTheme == mode
                      ? theme.primary
                      : theme.bgLight,
                  shadowColor: currentTheme == mode
                      ? theme.primary
                      : theme.bgLight,
                  shape: RoundedRectangleBorder(
                    borderRadius: AppRadius.borderLg,
                  ),
                ),
                onPressed: click(() {
                  context.read<SettingsBloc>().add(SettingsChangeTheme(mode));
                  Navigator.pop(dialogContext);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '${context.l10n.theme}: ${mode.displayName}',
                        style: TextStyle(
                          color: theme.sText,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      duration: const Duration(seconds: 2),
                      backgroundColor: theme.primary,
                    ),
                  );
                }),
                child: Text(
                  mode.displayName,
                  style: TextStyle(
                    color: currentTheme == mode ? theme.sText : theme.textMuted,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showLanguageDialog(BuildContext context, AppLanguage currentLanguage) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: theme.bgLight,
        title: Text(
          context.l10n.selectLanguage,
          style: TextStyle(color: theme.text),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: AppLanguage.values.map((lang) {
            return RadioListTile<AppLanguage>(
              title: Text(
                lang.displayName,
                style: TextStyle(
                  color: theme.textMuted,
                  fontWeight: FontWeight.w500,
                ),
              ),
              value: lang,
              groupValue: currentLanguage,
              activeColor: theme.primary,
              onChanged: (value) {
                if (value != null) {
                  select(null);
                  context.read<SettingsBloc>().add(
                    SettingsChangeLanguage(value),
                  );
                  Navigator.pop(dialogContext);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '${context.l10n.language}: ${value.displayName}',
                        style: TextStyle(
                          color: theme.sText,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      duration: const Duration(seconds: 2),
                      backgroundColor: theme.primary,
                    ),
                  );
                }
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showCurrencyDialog(BuildContext context, Currency currentCurrency) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: theme.bgLight,
        title: Text(
          context.l10n.selectCurrency,
          style: TextStyle(color: theme.text),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: Currency.values.map((curr) {
            return RadioListTile<Currency>(
              overlayColor: WidgetStateProperty.all(theme.primary),
              splashRadius: AppRadius.huge,
              title: Text(
                curr.displayName,
                style: TextStyle(
                  color: theme.textMuted,
                  fontWeight: FontWeight.w500,
                ),
              ),
              value: curr,
              groupValue: currentCurrency,
              activeColor: theme.primary,
              onChanged: (value) {
                if (value != null) {
                  select(null);
                  context.read<SettingsBloc>().add(
                    SettingsChangeCurrency(value),
                  );
                  Navigator.pop(dialogContext);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '${context.l10n.currency}: ${value.displayName}',
                        style: TextStyle(
                          color: theme.sText,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      duration: const Duration(seconds: 2),
                      backgroundColor: theme.primary,
                    ),
                  );
                }
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showClearCacheDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: theme.bgLight,
        title: Text(
          context.l10n.clearCacheConfirmTitle,
          style: TextStyle(color: theme.text),
        ),
        content: Text(
          context.l10n.clearCacheConfirmMessage,
          style: TextStyle(color: theme.textMuted),
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: AppRadius.borderMd,
              ),
              overlayColor: theme.primary,
            ),
            onPressed: click(() => Navigator.pop(dialogContext)),
            child: Text(
              context.l10n.cancel,
              style: TextStyle(color: theme.textMuted),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: AppRadius.borderMd,
              ),
              overlayColor: theme.primary,
            ),
            onPressed: () {
              context.read<SettingsBloc>().add(SettingsClearCache());
              Navigator.pop(dialogContext);
              success(null);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    context.l10n.cacheClearedSuccess,
                    style: TextStyle(
                      color: theme.sText,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  duration: AppDurations.slow,
                  backgroundColor: theme.primary,
                ),
              );
            },
            child: Text(
              context.l10n.clear,
              style: TextStyle(
                color: theme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
