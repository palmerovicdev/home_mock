import 'dart:async';
import 'dart:ui' as ui;

import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/locator.dart';
import '../../../model/entity/settings.dart';
import '../../../model/entity/user.dart';
import 'settings_event.dart';
import 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState()) {
    on<SettingsLoadPreferences>(_onLoadPreferences);
    on<SettingsChangeTheme>(_onChangeTheme);
    on<SettingsChangeLanguage>(_onChangeLanguage);
    on<SettingsChangeCurrency>(_onChangeCurrency);
    on<SettingsClearCache>(_onClearCache);
    on<SettingsLogout>(_onLogout);
    on<SettingsUpdateUser>(_onUpdateUser);
  }

  static const String _keyThemeMode = 'theme_mode';
  static const String _keyLanguage = 'language';
  static const String _keyCurrency = 'currency';
  static const String _keyUserId = 'user_id';
  static const String _keyUserEmail = 'user_email';
  static const String _keyUserName = 'user_name';
  static const String _keyUserAvatar = 'user_avatar';
  static const String _keyUserLoggedIn = 'user_logged_in';

  Future<void> _onLoadPreferences(
    SettingsLoadPreferences event,
    Emitter<SettingsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      final prefs = await SharedPreferences.getInstance();

      final themeModeStr = prefs.getString(_keyThemeMode);
      final themeMode = themeModeStr != null
          ? AppThemeMode.values.firstWhere(
              (e) => e.name == themeModeStr,
              orElse: () => AppThemeMode.system,
            )
          : AppThemeMode.system;

      final languageStr = prefs.getString(_keyLanguage);
      final language = languageStr != null
          ? AppLanguage.values.firstWhere(
              (e) => e.code == languageStr,
              orElse: () => AppLanguage.es,
            )
          : AppLanguage.es;

      final currencyStr = prefs.getString(_keyCurrency);
      final currency = currencyStr != null
          ? Currency.values.firstWhere(
              (e) => e.code == currencyStr,
              orElse: () => Currency.usd,
            )
          : Currency.usd;

      final userId = prefs.getString(_keyUserId);
      User? user;
      if (userId != null) {
        user = User(
          id: userId,
          email: prefs.getString(_keyUserEmail) ?? '',
          name: prefs.getString(_keyUserName) ?? '',
          avatarUrl: prefs.getString(_keyUserAvatar) ?? '',
          isLoggedIn: prefs.getBool(_keyUserLoggedIn) ?? false,
        );
      } else {
        user = User.mock();
        await _saveUser(prefs, user);
      }

      final isDarkMode = _calculateIsDarkMode(themeMode);

      theme.setDarkMode(isDarkMode);

      emit(
        state.copyWith(
          user: user,
          themeMode: themeMode,
          language: language,
          currency: currency,
          isDarkMode: isDarkMode,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> _onChangeTheme(
    SettingsChangeTheme event,
    Emitter<SettingsState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyThemeMode, event.themeMode.name);

    final isDarkMode = _calculateIsDarkMode(event.themeMode);
    theme.setDarkMode(isDarkMode);

    emit(
      state.copyWith(
        themeMode: event.themeMode,
        isDarkMode: isDarkMode,
      ),
    );
  }

  Future<void> _onChangeLanguage(
    SettingsChangeLanguage event,
    Emitter<SettingsState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyLanguage, event.language.code);

    emit(state.copyWith(language: event.language));
  }

  Future<void> _onChangeCurrency(
    SettingsChangeCurrency event,
    Emitter<SettingsState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyCurrency, event.currency.code);

    emit(state.copyWith(currency: event.currency));
  }

  Future<void> _onClearCache(
    SettingsClearCache event,
    Emitter<SettingsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      final prefs = await SharedPreferences.getInstance();

      final currentTheme = AppThemeMode.system.name;
      final currentLanguage = AppLanguage.es.code;
      final currentCurrency = Currency.usd.code;
      final currentUser = state.user;

      await prefs.clear();

      await prefs.setString(_keyThemeMode, currentTheme);
      await prefs.setString(_keyLanguage, currentLanguage);
      await prefs.setString(_keyCurrency, currentCurrency);

      if (currentUser != null) {
        await _saveUser(prefs, currentUser);
      }

      final isDarkMode = _calculateIsDarkMode(AppThemeMode.system);
      theme.setDarkMode(isDarkMode);

      emit(
        state.copyWith(
          isLoading: false,
          themeMode: AppThemeMode.system,
          currency: Currency.usd,
          language: AppLanguage.es,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> _onLogout(
    SettingsLogout event,
    Emitter<SettingsState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUserId);
    await prefs.remove(_keyUserEmail);
    await prefs.remove(_keyUserName);
    await prefs.remove(_keyUserAvatar);
    await prefs.remove(_keyUserLoggedIn);

    emit(state.copyWith(user: null));
  }

  Future<void> _onUpdateUser(
    SettingsUpdateUser event,
    Emitter<SettingsState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await _saveUser(prefs, event.user);

    emit(state.copyWith(user: event.user));
  }

  Future<void> _saveUser(SharedPreferences prefs, User user) async {
    await prefs.setString(_keyUserId, user.id);
    await prefs.setString(_keyUserEmail, user.email);
    await prefs.setString(_keyUserName, user.name);
    await prefs.setString(_keyUserAvatar, user.avatarUrl);
    await prefs.setBool(_keyUserLoggedIn, user.isLoggedIn);
  }

  bool _calculateIsDarkMode(AppThemeMode themeMode) {
    switch (themeMode) {
      case AppThemeMode.light:
        return false;
      case AppThemeMode.dark:
        return true;
      case AppThemeMode.system:
        final brightness = ui.PlatformDispatcher.instance.platformBrightness;
        return brightness == ui.Brightness.dark;
    }
  }
}
