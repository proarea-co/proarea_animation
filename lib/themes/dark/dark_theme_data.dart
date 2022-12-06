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
    headlineLarge: TextStyle(
      fontSize: 64,
      fontFamily: FontFamily.billy,
      fontWeight: FontWeight.w600,
    ),
    subtitle1: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600,
    ),
  ),
  extensions: [
    AppMenuItemStyles.dark(),
  ],
);
