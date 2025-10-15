enum AppThemeMode {
  system,
  light,
  dark;

  String get displayName {
    switch (this) {
      case AppThemeMode.system:
        return 'Sistema';
      case AppThemeMode.light:
        return 'Claro';
      case AppThemeMode.dark:
        return 'Oscuro';
    }
  }
}

enum AppLanguage {
  es,
  en;

  String get displayName {
    switch (this) {
      case AppLanguage.es:
        return 'Español';
      case AppLanguage.en:
        return 'English';
    }
  }

  String get code {
    switch (this) {
      case AppLanguage.es:
        return 'es';
      case AppLanguage.en:
        return 'en';
    }
  }
}

enum Currency {
  usd,
  eur;

  String get displayName {
    switch (this) {
      case Currency.usd:
        return 'USD - Dólar';
      case Currency.eur:
        return 'EUR - Euro';
    }
  }

  String get symbol {
    switch (this) {
      case Currency.usd:
        return '\$';
      case Currency.eur:
        return '€';
    }
  }

  String get code {
    switch (this) {
      case Currency.usd:
        return 'USD';
      case Currency.eur:
        return 'EUR';
    }
  }
}
