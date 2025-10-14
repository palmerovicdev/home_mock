import 'package:flutter/cupertino.dart';

class Theme {
  bool isDark;

  Theme(this.isDark);

  Color get bgDark => isDark ? Dark.bgDark.toColor() : Light.bgDark.toColor();

  Color get bg => isDark ? Dark.bg.toColor() : Light.bg.toColor();

  Color get bgLight => isDark ? Dark.bgLight.toColor() : Light.bgLight.toColor();

  Color get text => isDark ? Dark.text.toColor() : Light.text.toColor();

  Color get textMuted => isDark ? Dark.textMuted.toColor() : Light.textMuted.toColor();

  Color get highlight => isDark ? Dark.highlight.toColor() : Light.highlight.toColor();

  Color get border => isDark ? Dark.border.toColor() : Light.border.toColor();

  Color get borderMuted => isDark ? Dark.borderMuted.toColor() : Light.borderMuted.toColor();

  Color get primary => isDark ? Dark.primary.toColor() : Light.primary.toColor();

  Color get secondary => isDark ? Dark.secondary.toColor() : Light.secondary.toColor();

  Color get danger => isDark ? Dark.danger.toColor() : Light.danger.toColor();

  Color get warning => isDark ? Dark.warning.toColor() : Light.warning.toColor();

  Color get success => isDark ? Dark.success.toColor() : Light.success.toColor();

  Color get info => isDark ? Dark.info.toColor() : Light.info.toColor();
}

class Dark {
  static final bgDark = HSLColor.fromAHSL(1, 34, 0.51, 0.01);
  static final bg = HSLColor.fromAHSL(1, 37, 0.33, 0.04);
  static final bgLight = HSLColor.fromAHSL(1, 38, 0.18, 0.08);
  static final text = HSLColor.fromAHSL(1, 38, 0.64, 0.93);
  static final textMuted = HSLColor.fromAHSL(1, 38, 0.13, 0.68);
  static final highlight = HSLColor.fromAHSL(1, 38, 0.10, 0.38);
  static final border = HSLColor.fromAHSL(1, 38, 0.13, 0.27);
  static final borderMuted = HSLColor.fromAHSL(1, 38, 0.19, 0.17);
  static final primary = HSLColor.fromAHSL(1, 39, 0.55, 0.61);
  static final secondary = HSLColor.fromAHSL(1, 218, 0.78, 0.75);
  static final danger = HSLColor.fromAHSL(1, 9, 0.26, 0.64);
  static final warning = HSLColor.fromAHSL(1, 52, 0.19, 0.57);
  static final success = HSLColor.fromAHSL(1, 146, 0.17, 0.59);
  static final info = HSLColor.fromAHSL(1, 217, 0.28, 0.65);
}

class Light {
  static final bgDark = HSLColor.fromAHSL(1, 38, 0.19, 0.89);
  static final bg = HSLColor.fromAHSL(1, 38, 0.36, 0.94);
  static final bgLight = HSLColor.fromAHSL(1, 38, 1.0, 0.99);
  static final text = HSLColor.fromAHSL(1, 35, 0.66, 0.04);
  static final textMuted = HSLColor.fromAHSL(1, 38, 0.13, 0.27);
  static final highlight = HSLColor.fromAHSL(1, 38, 1.0, 0.99);
  static final border = HSLColor.fromAHSL(1, 38, 0.08, 0.49);
  static final borderMuted = HSLColor.fromAHSL(1, 38, 0.10, 0.61);
  static final primary = HSLColor.fromAHSL(1, 43, 1.0, 0.15);
  static final secondary = HSLColor.fromAHSL(1, 218, 0.52, 0.32);
  static final danger = HSLColor.fromAHSL(1, 9, 0.21, 0.41);
  static final warning = HSLColor.fromAHSL(1, 52, 0.23, 0.34);
  static final success = HSLColor.fromAHSL(1, 147, 0.19, 0.36);
  static final info = HSLColor.fromAHSL(1, 217, 0.22, 0.41);
}
