part of '../theme_app.dart';

final _darkThemeData = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: LightStyleConstants.blue,
    onPrimary: LightStyleConstants.purple,
  ),
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
