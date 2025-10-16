import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/locator.dart';
import '../../../core/utils/feedback.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
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
      onTap: select(() {
        HapticFeedback.selectionClick();
        onTap.call();
      }),
    );
  }
}
