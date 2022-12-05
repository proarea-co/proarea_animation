part of '../theme_app.dart';

final _lightThemeData = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    error: LightStyleConstants.error,
    tertiary: LightStyleConstants.charcoalTint3,
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(
      color: LightStyleConstants.white,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  ),
);
