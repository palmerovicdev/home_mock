import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/locator.dart';
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
          title: 'Apariencia',
          children: [
            SettingsTile(
              icon: Icons.palette_outlined,
              title: 'Tema',
              subtitle: state.themeMode.displayName,
              onTap: () => _showThemeDialog(context, state.themeMode),
            ),
          ],
        ),
        SettingsGroup(
          title: 'Localización',
          children: [
            SettingsTile(
              icon: Icons.language_outlined,
              title: 'Idioma',
              subtitle: state.language.displayName,
              onTap: () => _showLanguageDialog(context, state.language),
            ),
            SettingsTile(
              icon: Icons.attach_money_outlined,
              title: 'Moneda',
              subtitle: state.currency.displayName,
              onTap: () => _showCurrencyDialog(context, state.currency),
            ),
          ],
        ),
        SettingsGroup(
          title: 'Datos',
          children: [
            SettingsTile(
              icon: Icons.cleaning_services_outlined,
              title: 'Limpiar caché',
              subtitle: 'Liberar espacio de almacenamiento',
              onTap: () => _showClearCacheDialog(context),
            ),
          ],
        ),
        const SizedBox(height: 32),
        Text(
          'Home Mock v1.0.0',
          style: TextStyle(
            color: theme.textMuted,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  void _showThemeDialog(BuildContext context, AppThemeMode currentTheme) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: theme.bgLight,
        title: Text('Seleccionar tema', style: TextStyle(color: theme.text)),
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
                  backgroundColor: currentTheme == mode ? theme.primary : theme.bgLight,
                  shadowColor: currentTheme == mode ? theme.primary : theme.bgLight,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  context.read<SettingsBloc>().add(SettingsChangeTheme(mode));
                  Navigator.pop(dialogContext);
                },
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
        title: Text('Seleccionar idioma', style: TextStyle(color: theme.text)),
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
                  context.read<SettingsBloc>().add(
                    SettingsChangeLanguage(value),
                  );
                  Navigator.pop(dialogContext);
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
        title: Text('Seleccionar moneda', style: TextStyle(color: theme.text)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: Currency.values.map((curr) {
            return RadioListTile<Currency>(
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
                  context.read<SettingsBloc>().add(
                    SettingsChangeCurrency(value),
                  );
                  Navigator.pop(dialogContext);
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
        title: Text('Limpiar caché', style: TextStyle(color: theme.text)),
        content: Text(
          '¿Estás seguro de que deseas limpiar el caché? Esta acción no se puede deshacer.',
          style: TextStyle(color: theme.textMuted),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text('Cancelar', style: TextStyle(color: theme.textMuted)),
          ),
          TextButton(
            onPressed: () {
              context.read<SettingsBloc>().add(SettingsClearCache());
              Navigator.pop(dialogContext);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Caché limpiado correctamente',
                    style: TextStyle(
                      color: theme.bgDark,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  duration: const Duration(milliseconds: 400),
                  backgroundColor: theme.primary,
                ),
              );
            },
            child: Text(
              'Limpiar',
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
