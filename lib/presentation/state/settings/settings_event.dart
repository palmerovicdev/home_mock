import '../../../model/entity/settings.dart';
import '../../../model/entity/user.dart';

abstract class SettingsEvent {}

class SettingsLoadPreferences extends SettingsEvent {}

class SettingsChangeTheme extends SettingsEvent {
  final AppThemeMode themeMode;

  SettingsChangeTheme(this.themeMode);
}

class SettingsChangeLanguage extends SettingsEvent {
  final AppLanguage language;

  SettingsChangeLanguage(this.language);
}

class SettingsChangeCurrency extends SettingsEvent {
  final Currency currency;

  SettingsChangeCurrency(this.currency);
}

class SettingsClearCache extends SettingsEvent {}

class SettingsLogout extends SettingsEvent {}

class SettingsUpdateUser extends SettingsEvent {
  final User user;

  SettingsUpdateUser(this.user);
}
