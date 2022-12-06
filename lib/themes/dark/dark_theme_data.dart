part of '../theme_app.dart';

final _darkThemeData = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: LightStyleConstants.charcoal,
    onPrimary: LightStyleConstants.white,
    tertiary: LightStyleConstants.blue,
    onTertiary: LightStyleConstants.purple,
  ),
  primarySwatch: Colors.red,
  textTheme: const TextTheme(
    subtitle1: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600,
    ),
  ),
  extensions: [
    AppMenuItemStyles.dark(),
  ],
);
