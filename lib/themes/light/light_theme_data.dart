part of '../theme_app.dart';

final _lightThemeData = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    error: LightStyleConstants.error,
    tertiary: LightStyleConstants.charcoalTint3,
    onTertiary: LightStyleConstants.blue,
  ),
  extensions: [
    AppMenuItemStyles.light(),
  ],
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: Colors.black, fontSize: 20),
    headline1: TextStyle(
      color: LightStyleConstants.white,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  ),
);
