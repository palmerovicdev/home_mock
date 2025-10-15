import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/locator.dart';
import '../../model/entity/settings.dart';
import '../state/settings/settings_bloc.dart';
import '../state/settings/settings_event.dart';
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
              'Configuración',
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
                _ProfileSection(user: state.user),
                const SizedBox(height: 16),
                _SettingsSection(state: state),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ProfileSection extends StatelessWidget {
  const _ProfileSection({required this.user});

  final dynamic user;

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.bgLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(user.avatarUrl),
          ),
          const SizedBox(height: 16),
          Text(
            user.name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: theme.text,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(
              fontSize: 14,
              color: theme.textMuted,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              _showLogoutDialog(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.bgDark,
              foregroundColor: theme.text,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: const Icon(Icons.logout, size: 18),
            label: const Text('Cerrar sesión'),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: theme.bgLight,
        title: Text(
          '¿Cerrar sesión?',
          style: TextStyle(color: theme.text),
        ),
        content: Text(
          'Se perderán los datos no guardados',
          style: TextStyle(color: theme.textMuted),
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text('Cancelar', style: TextStyle(color: theme.textMuted)),
          ),
          TextButton(
            onPressed: () {
              context.read<SettingsBloc>().add(SettingsLogout());
              context.pop();
              context.pop();
            },
            child: Text(
              'Cerrar sesión',
              style: TextStyle(color: theme.primary),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  const _SettingsSection({required this.state});

  final SettingsState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SettingsGroup(
          title: 'Apariencia',
          children: [
            _SettingsTile(
              icon: Icons.palette_outlined,
              title: 'Tema',
              subtitle: state.themeMode.displayName,
              onTap: () => _showThemeDialog(context, state.themeMode),
            ),
          ],
        ),
        _SettingsGroup(
          title: 'Localización',
          children: [
            _SettingsTile(
              icon: Icons.language_outlined,
              title: 'Idioma',
              subtitle: state.language.displayName,
              onTap: () => _showLanguageDialog(context, state.language),
            ),
            _SettingsTile(
              icon: Icons.attach_money_outlined,
              title: 'Moneda',
              subtitle: state.currency.displayName,
              onTap: () => _showCurrencyDialog(context, state.currency),
            ),
          ],
        ),
        _SettingsGroup(
          title: 'Datos',
          children: [
            _SettingsTile(
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
          children: AppThemeMode.values.map((mode) {
            return RadioListTile<AppThemeMode>(
              title: Text(
                mode.displayName,
                style: TextStyle(color: theme.text),
              ),
              value: mode,
              groupValue: currentTheme,
              activeColor: theme.primary,
              onChanged: (value) {
                if (value != null) {
                  context.read<SettingsBloc>().add(SettingsChangeTheme(value));
                  Navigator.pop(dialogContext);
                }
              },
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
                style: TextStyle(color: theme.text),
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
                style: TextStyle(color: theme.text),
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
                  content: const Text('Caché limpiado correctamente'),
                  backgroundColor: theme.primary,
                ),
              );
            },
            child: Text('Limpiar', style: TextStyle(color: theme.primary)),
          ),
        ],
      ),
    );
  }
}

class _SettingsGroup extends StatelessWidget {
  const _SettingsGroup({
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: theme.bgLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: theme.textMuted,
                letterSpacing: 0.5,
              ),
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: theme.primary),
      title: Text(
        title,
        style: TextStyle(
          color: theme.text,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: theme.textMuted, fontSize: 13),
      ),
      trailing: Icon(Icons.chevron_right, color: theme.textMuted),
      onTap: onTap,
    );
  }
}
