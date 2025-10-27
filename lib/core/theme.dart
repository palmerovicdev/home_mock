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

  Color get bgDark => isDark
      ? HSLColor.fromAHSL(1.0, 6, 0.22, 0.01).toColor()
      : HSLColor.fromAHSL(1.0, 7, 0.10, 0.90).toColor();

  Color get bg => isDark
      ? HSLColor.fromAHSL(1.0, 7, 0.14, 0.05).toColor()
      : HSLColor.fromAHSL(1.0, 7, 0.21, 0.95).toColor();

  Color get bgLight => isDark
      ? HSLColor.fromAHSL(1.0, 7, 0.08, 0.09).toColor()
      : HSLColor.fromAHSL(1.0, 7, 1.0, 1.0).toColor();

  Color get text => isDark
      ? HSLColor.fromAHSL(1.0, 7, 0.44, 0.95).toColor()
      : HSLColor.fromAHSL(1.0, 7, 0.26, 0.05).toColor();

  Color get textMuted => isDark
      ? HSLColor.fromAHSL(1.0, 7, 0.06, 0.70).toColor()
      : HSLColor.fromAHSL(1.0, 7, 0.06, 0.29).toColor();

  Color get border => isDark
      ? HSLColor.fromAHSL(1.0, 7, 0.06, 0.29).toColor()
      : HSLColor.fromAHSL(1.0, 7, 0.04, 0.51).toColor();

  Color get borderMuted => isDark
      ? HSLColor.fromAHSL(1.0, 7, 0.08, 0.18).toColor()
      : HSLColor.fromAHSL(1.0, 7, 0.05, 0.63).toColor();

  Color get highlight => isDark
      ? HSLColor.fromAHSL(1.0, 7, 0.04, 0.39).toColor()
      : HSLColor.fromAHSL(1.0, 7, 1.0, 1.0).toColor();

  Color get primary => isDark
      ? HSLColor.fromAHSL(1.0, 6, 0.68, 0.74).toColor()
      : HSLColor.fromAHSL(1.0, 4, 0.48, 0.31).toColor();

  Color get secondary => isDark
      ? HSLColor.fromAHSL(1.0, 187, 0.57, 0.58).toColor()
      : HSLColor.fromAHSL(1.0, 186, 1.0, 0.11).toColor();

  Color get danger => isDark
      ? HSLColor.fromAHSL(1.0, 9, 0.26, 0.64).toColor()
      : HSLColor.fromAHSL(1.0, 9, 0.21, 0.41).toColor();

  Color get warning => isDark
      ? HSLColor.fromAHSL(1.0, 52, 0.19, 0.57).toColor()
      : HSLColor.fromAHSL(1.0, 52, 0.23, 0.34).toColor();

  Color get success => isDark
      ? HSLColor.fromAHSL(1.0, 146, 0.17, 0.59).toColor()
      : HSLColor.fromAHSL(1.0, 147, 0.19, 0.36).toColor();

  Color get info => isDark
      ? HSLColor.fromAHSL(1.0, 217, 0.28, 0.65).toColor()
      : HSLColor.fromAHSL(1.0, 217, 0.22, 0.41).toColor();
}
