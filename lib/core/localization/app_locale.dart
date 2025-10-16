import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

/// Helper class para acceder fácilmente a las traducciones
class AppLocale {
  static AppLocalizations of(BuildContext context) {
    return AppLocalizations.of(context)!;
  }

  static String get currentLanguageCode {
    return 'es';
  }
}

/// Extension para facilitar el acceso a las traducciones
extension LocalizationExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
