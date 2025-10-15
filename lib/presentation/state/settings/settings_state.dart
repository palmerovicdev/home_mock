import 'package:equatable/equatable.dart';

import '../../../model/entity/settings.dart';
import '../../../model/entity/user.dart';

class SettingsState extends Equatable {
  final User? user;
  final AppThemeMode themeMode;
  final AppLanguage language;
  final Currency currency;
  final bool isDarkMode;
  final bool isLoading;
  final String? error;

  const SettingsState({
    this.user,
    this.themeMode = AppThemeMode.system,
    this.language = AppLanguage.es,
    this.currency = Currency.usd,
    this.isDarkMode = true,
    this.isLoading = false,
    this.error,
  });

  @override
  List<Object?> get props => [
    user,
    themeMode,
    language,
    currency,
    isDarkMode,
    isLoading,
    error,
  ];

  SettingsState copyWith({
    User? user,
    AppThemeMode? themeMode,
    AppLanguage? language,
    Currency? currency,
    bool? isDarkMode,
    bool? isLoading,
    String? error,
  }) {
    return SettingsState(
      user: user ?? this.user,
      themeMode: themeMode ?? this.themeMode,
      language: language ?? this.language,
      currency: currency ?? this.currency,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
