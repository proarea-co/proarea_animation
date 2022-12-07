part of '../theme_app.dart';

final _lightThemeData = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: LightStyleConstants.charcoal,
    onPrimary: LightStyleConstants.white,
    error: LightStyleConstants.error,
    tertiary: LightStyleConstants.charcoalTint3,
    onTertiary: LightStyleConstants.blue,
    onBackground: LightStyleConstants.transparent,
    secondary: LightStyleConstants.charcoalTint3,
    onSecondary: LightStyleConstants.charcoalTint2,
  ),
  extensions: [
    AppMenuItemStyles.light(),
  ],
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
    bodyText1: TextStyle(color: Colors.black, fontSize: 20),
    headline1: TextStyle(
      color: LightStyleConstants.white,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  ),
);
