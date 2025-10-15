import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

enum ColorScheme {
  purple,
  blue,
  pink,
}

class Theme {
  bool isDark;
  ColorScheme colorScheme;
  _ColorPalette? _cachedPalette;

  Theme(this.isDark, {this.colorScheme = ColorScheme.purple});

  Future<void> load() async {
    _cachedPalette = await _loadPalette();
  }

  Future<void> reload() async {
    _cachedPalette = await _loadPalette();
  }

  Future<void> toggleDarkMode() async {
    isDark = !isDark;
    await reload();
  }

  Future<void> setDarkMode(bool darkMode) async {
    isDark = darkMode;
    await reload();
  }

  Future<void> changeColorScheme(ColorScheme newScheme) async {
    colorScheme = newScheme;
    await reload();
  }

  Future<_ColorPalette> _loadPalette() async {
    final schemeName = colorScheme.name;
    final brightness = isDark ? 'dark' : 'light';
    final path = 'assets/themes/${schemeName}_$brightness.json';

    final jsonString = await rootBundle.loadString(path);
    final Map<String, dynamic> json = jsonDecode(jsonString);

    return _ColorPalette.fromJson(json);
  }

  _ColorPalette get _palette {
    if (_cachedPalette == null) {
      throw StateError('Theme not loaded. Call load() first.');
    }
    return _cachedPalette!;
  }

  Color get bgDark => _palette.bgDark.toColor();

  Color get bg => _palette.bg.toColor();

  Color get bgLight => _palette.bgLight.toColor();

  Color get text => _palette.text.toColor();

  Color get textMuted => _palette.textMuted.toColor();

  Color get highlight => _palette.highlight.toColor();

  Color get border => _palette.border.toColor();

  Color get borderMuted => _palette.borderMuted.toColor();

  Color get primary => _palette.primary.toColor();

  Color get secondary => _palette.secondary.toColor();

  Color get danger => _palette.danger.toColor();

  Color get warning => _palette.warning.toColor();

  Color get success => _palette.success.toColor();

  Color get info => _palette.info.toColor();
}

class _ColorPalette {
  final HSLColor bgDark;
  final HSLColor bg;
  final HSLColor bgLight;
  final HSLColor text;
  final HSLColor textMuted;
  final HSLColor highlight;
  final HSLColor border;
  final HSLColor borderMuted;
  final HSLColor primary;
  final HSLColor secondary;
  final HSLColor danger;
  final HSLColor warning;
  final HSLColor success;
  final HSLColor info;

  _ColorPalette({
    required this.bgDark,
    required this.bg,
    required this.bgLight,
    required this.text,
    required this.textMuted,
    required this.highlight,
    required this.border,
    required this.borderMuted,
    required this.primary,
    required this.secondary,
    required this.danger,
    required this.warning,
    required this.success,
    required this.info,
  });

  factory _ColorPalette.fromJson(Map<String, dynamic> json) {
    HSLColor parseColor(Map<String, dynamic> colorJson) {
      return HSLColor.fromAHSL(
        1.0,
        (colorJson['h'] as num).toDouble(),
        (colorJson['s'] as num).toDouble(),
        (colorJson['l'] as num).toDouble(),
      );
    }

    return _ColorPalette(
      bgDark: parseColor(json['bgDark']),
      bg: parseColor(json['bg']),
      bgLight: parseColor(json['bgLight']),
      text: parseColor(json['text']),
      textMuted: parseColor(json['textMuted']),
      highlight: parseColor(json['highlight']),
      border: parseColor(json['border']),
      borderMuted: parseColor(json['borderMuted']),
      primary: parseColor(json['primary']),
      secondary: parseColor(json['secondary']),
      danger: parseColor(json['danger']),
      warning: parseColor(json['warning']),
      success: parseColor(json['success']),
      info: parseColor(json['info']),
    );
  }
}
