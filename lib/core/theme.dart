import 'package:flutter/material.dart';

class Theme {
  bool isDark;

  Theme(this.isDark);

  void toggleDarkMode() {
    isDark = !isDark;
  }

  void setDarkMode(bool darkMode) {
    isDark = darkMode;
  }

  Color get bgDark => isDark ? const Color(0xFF191718) : const Color(0xFFEBE6DC);

  Color get bg => isDark ? const Color(0xFF242122) : const Color(0xFFF3EEE5);

  Color get bgLight => isDark ? const Color(0xFF161418) : const Color(0xFFFFFFFF);

  Color get text => isDark ? const Color(0xFFEEEDE4) : const Color(0xFF23201F);

  Color get textMuted => isDark ? const Color(0xFF888586) : const Color(0xFF575249);

  Color get border => isDark ? const Color(0xFF2C292A) : const Color(0xFF918D84);

  Color get borderMuted => isDark ? const Color(0xFF302F34) : const Color(0xFFA39BA8);

  Color get highlight => isDark ? const Color(0xFF655F66) : const Color(0xFFFFFFFF);

  Color get sBgDark => const Color(0xFF1F1B1C);

  Color get sText => const Color(0xFFEEEDE4);

  Color get sTextMuted => const Color(0xFF9A968D);

  Color get primary => const Color(0xFFD3493C);

  Color get secondary => const Color(0xFF90A959);

  Color get danger => const Color(0xFFAC8A8C);

  Color get warning => const Color(0xFF8F8770);

  Color get success => const Color(0xFF75958A);

  Color get info => const Color(0xFF6F95B4);
}
