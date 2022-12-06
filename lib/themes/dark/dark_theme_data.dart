part of '../theme_app.dart';

final _darkThemeData = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: LightStyleConstants.blue,
    onPrimary: LightStyleConstants.purple,
  ),
  textTheme: TextTheme(
    bodyLarge: const TextStyle(
      fontSize: 64,
      fontFamily: FontFamily.billy,
      fontWeight: FontWeight.w600,
    ),
    subtitle1: const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600,
    ),
  ),
  extensions: [
    AppMenuItemStyles.dark(),
  ],
);
