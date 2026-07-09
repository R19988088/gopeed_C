import 'package:flutter/material.dart';

class GopeedTheme {
  static const defaultAccentColor = 0xFF79C476;
  static const standardFontSize = 13.0;

  static MaterialColor _swatch(Color color) {
    final hsl = HSLColor.fromColor(color);
    return MaterialColor(color.value, <int, Color>{
      50: hsl.withLightness(.95).toColor(),
      100: hsl.withLightness(.88).toColor(),
      200: hsl.withLightness(.78).toColor(),
      300: hsl.withLightness(.68).toColor(),
      400: hsl.withLightness(.58).toColor(),
      500: color,
      600: hsl.withLightness(.46).toColor(),
      700: hsl.withLightness(.38).toColor(),
      800: hsl.withLightness(.30).toColor(),
      900: hsl.withLightness(.22).toColor(),
    });
  }

  static TextStyle? _size(TextStyle? style) =>
      style?.copyWith(fontSize: standardFontSize);

  static TextTheme _standardTextTheme(TextTheme textTheme) {
    return textTheme.copyWith(
      bodyLarge: _size(textTheme.bodyLarge),
      bodyMedium: _size(textTheme.bodyMedium),
      bodySmall: _size(textTheme.bodySmall),
      labelLarge: _size(textTheme.labelLarge),
      labelMedium: _size(textTheme.labelMedium),
      labelSmall: _size(textTheme.labelSmall),
    );
  }

  static InputDecorationTheme _inputDecorationTheme(ThemeData base) {
    return base.inputDecorationTheme.copyWith(
      labelStyle: _size(base.inputDecorationTheme.labelStyle) ??
          TextStyle(color: base.hintColor, fontSize: standardFontSize),
      floatingLabelStyle: _size(base.inputDecorationTheme.floatingLabelStyle),
      hintStyle: _size(base.inputDecorationTheme.hintStyle),
      helperStyle: _size(base.inputDecorationTheme.helperStyle),
      errorStyle: _size(base.inputDecorationTheme.errorStyle),
    );
  }

  static ThemeData light([
    int accentColor = defaultAccentColor,
    int tabActiveColor = 0xFF3D7E3A,
  ]) {
    final color = Color(accentColor);
    final swatch = _swatch(color);
    final accent = _swatch(
      HSLColor.fromColor(color).withLightness(.89).toColor(),
    );
    final base = ThemeData(
      useMaterial3: false,
      brightness: Brightness.light,
      primarySwatch: swatch,
    );
    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        secondary: accent,
        tertiary: Color(tabActiveColor),
      ),
      inputDecorationTheme: _inputDecorationTheme(base),
      primaryTextTheme: _standardTextTheme(base.primaryTextTheme),
      textTheme: _standardTextTheme(base.textTheme),
    );
  }

  static ThemeData dark([
    int accentColor = defaultAccentColor,
    int tabActiveColor = 0xFF3D7E3A,
  ]) {
    final color = Color(accentColor);
    final swatch = _swatch(color);
    final accent = _swatch(
      HSLColor.fromColor(color).withLightness(.35).toColor(),
    );
    final base = ThemeData(
      useMaterial3: false,
      brightness: Brightness.dark,
      primarySwatch: swatch,
    );
    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        secondary: accent,
        tertiary: Color(tabActiveColor),
      ),
      inputDecorationTheme: _inputDecorationTheme(base),
      primaryTextTheme: _standardTextTheme(base.primaryTextTheme),
      textTheme: _standardTextTheme(base.textTheme),
    );
  }
}
