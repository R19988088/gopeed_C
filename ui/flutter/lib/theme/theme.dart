import 'package:flutter/material.dart';

class GopeedTheme {
  static const defaultAccentColor = 0xFF79C476;

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
        primary: Color(tabActiveColor),
        secondary: accent,
      ),
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
        primary: Color(tabActiveColor),
        secondary: accent,
      ),
    );
  }
}
