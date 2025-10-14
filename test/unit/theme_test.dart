import 'package:flutter/material.dart' hide Theme;
import 'package:flutter_test/flutter_test.dart';
import 'package:home_mock/core/theme.dart';

void main() {
  group('Theme', () {
    test('should create theme with correct initial state', () {
      final theme = Theme(false);

      expect(theme.isDark, equals(false));
    });

    test('should return light colors when not dark mode', () {
      final theme = Theme(false);

      expect(theme.bgDark, equals(Light.bgDark.toColor()));
      expect(theme.bg, equals(Light.bg.toColor()));
      expect(theme.bgLight, equals(Light.bgLight.toColor()));
      expect(theme.text, equals(Light.text.toColor()));
      expect(theme.textMuted, equals(Light.textMuted.toColor()));
      expect(theme.primary, equals(Light.primary.toColor()));
      expect(theme.secondary, equals(Light.secondary.toColor()));
      expect(theme.danger, equals(Light.danger.toColor()));
      expect(theme.warning, equals(Light.warning.toColor()));
      expect(theme.success, equals(Light.success.toColor()));
      expect(theme.info, equals(Light.info.toColor()));
    });

    test('should return dark colors when dark mode', () {
      final theme = Theme(true);

      expect(theme.bgDark, equals(Dark.bgDark.toColor()));
      expect(theme.bg, equals(Dark.bg.toColor()));
      expect(theme.bgLight, equals(Dark.bgLight.toColor()));
      expect(theme.text, equals(Dark.text.toColor()));
      expect(theme.textMuted, equals(Dark.textMuted.toColor()));
      expect(theme.primary, equals(Dark.primary.toColor()));
      expect(theme.secondary, equals(Dark.secondary.toColor()));
      expect(theme.danger, equals(Dark.danger.toColor()));
      expect(theme.warning, equals(Dark.warning.toColor()));
      expect(theme.success, equals(Dark.success.toColor()));
      expect(theme.info, equals(Dark.info.toColor()));
    });

    test('should toggle between light and dark mode', () {
      final theme = Theme(false);

      expect(theme.isDark, equals(false));
      expect(theme.bgDark, equals(Light.bgDark.toColor()));

      theme.isDark = true;

      expect(theme.isDark, equals(true));
      expect(theme.bgDark, equals(Dark.bgDark.toColor()));
    });

    test('should have consistent color values', () {
      final lightTheme = Theme(false);
      final darkTheme = Theme(true);

      expect(lightTheme.bgDark, isA<Color>());
      expect(lightTheme.bg, isA<Color>());
      expect(lightTheme.bgLight, isA<Color>());
      expect(lightTheme.text, isA<Color>());
      expect(lightTheme.textMuted, isA<Color>());
      expect(lightTheme.primary, isA<Color>());
      expect(lightTheme.secondary, isA<Color>());
      expect(lightTheme.danger, isA<Color>());
      expect(lightTheme.warning, isA<Color>());
      expect(lightTheme.success, isA<Color>());
      expect(lightTheme.info, isA<Color>());

      expect(darkTheme.bgDark, isA<Color>());
      expect(darkTheme.bg, isA<Color>());
      expect(darkTheme.bgLight, isA<Color>());
      expect(darkTheme.text, isA<Color>());
      expect(darkTheme.textMuted, isA<Color>());
      expect(darkTheme.primary, isA<Color>());
      expect(darkTheme.secondary, isA<Color>());
      expect(darkTheme.danger, isA<Color>());
      expect(darkTheme.warning, isA<Color>());
      expect(darkTheme.success, isA<Color>());
      expect(darkTheme.info, isA<Color>());
    });
  });

  group('Dark Colors', () {
    test('should have valid HSL color values', () {
      expect(Dark.bgDark, isA<HSLColor>());
      expect(Dark.bg, isA<HSLColor>());
      expect(Dark.bgLight, isA<HSLColor>());
      expect(Dark.text, isA<HSLColor>());
      expect(Dark.textMuted, isA<HSLColor>());
      expect(Dark.highlight, isA<HSLColor>());
      expect(Dark.border, isA<HSLColor>());
      expect(Dark.borderMuted, isA<HSLColor>());
      expect(Dark.primary, isA<HSLColor>());
      expect(Dark.secondary, isA<HSLColor>());
      expect(Dark.danger, isA<HSLColor>());
      expect(Dark.warning, isA<HSLColor>());
      expect(Dark.success, isA<HSLColor>());
      expect(Dark.info, isA<HSLColor>());
    });

    test('should have valid alpha values', () {
      expect(Dark.bgDark.alpha, equals(1.0));
      expect(Dark.bg.alpha, equals(1.0));
      expect(Dark.bgLight.alpha, equals(1.0));
      expect(Dark.text.alpha, equals(1.0));
      expect(Dark.textMuted.alpha, equals(1.0));
      expect(Dark.highlight.alpha, equals(1.0));
      expect(Dark.border.alpha, equals(1.0));
      expect(Dark.borderMuted.alpha, equals(1.0));
      expect(Dark.primary.alpha, equals(1.0));
      expect(Dark.secondary.alpha, equals(1.0));
      expect(Dark.danger.alpha, equals(1.0));
      expect(Dark.warning.alpha, equals(1.0));
      expect(Dark.success.alpha, equals(1.0));
      expect(Dark.info.alpha, equals(1.0));
    });
  });

  group('Light Colors', () {
    test('should have valid HSL color values', () {
      expect(Light.bgDark, isA<HSLColor>());
      expect(Light.bg, isA<HSLColor>());
      expect(Light.bgLight, isA<HSLColor>());
      expect(Light.text, isA<HSLColor>());
      expect(Light.textMuted, isA<HSLColor>());
      expect(Light.highlight, isA<HSLColor>());
      expect(Light.border, isA<HSLColor>());
      expect(Light.borderMuted, isA<HSLColor>());
      expect(Light.primary, isA<HSLColor>());
      expect(Light.secondary, isA<HSLColor>());
      expect(Light.danger, isA<HSLColor>());
      expect(Light.warning, isA<HSLColor>());
      expect(Light.success, isA<HSLColor>());
      expect(Light.info, isA<HSLColor>());
    });

    test('should have valid alpha values', () {
      expect(Light.bgDark.alpha, equals(1.0));
      expect(Light.bg.alpha, equals(1.0));
      expect(Light.bgLight.alpha, equals(1.0));
      expect(Light.text.alpha, equals(1.0));
      expect(Light.textMuted.alpha, equals(1.0));
      expect(Light.highlight.alpha, equals(1.0));
      expect(Light.border.alpha, equals(1.0));
      expect(Light.borderMuted.alpha, equals(1.0));
      expect(Light.primary.alpha, equals(1.0));
      expect(Light.secondary.alpha, equals(1.0));
      expect(Light.danger.alpha, equals(1.0));
      expect(Light.warning.alpha, equals(1.0));
      expect(Light.success.alpha, equals(1.0));
      expect(Light.info.alpha, equals(1.0));
    });
  });
}
