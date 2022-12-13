part of '../theme_app.dart';

final _lightThemeData = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: LightStyleConstants.charcoal,
    onPrimary: LightStyleConstants.white,
    error: LightStyleConstants.error,
    tertiary: LightStyleConstants.purple,
    onTertiary: LightStyleConstants.blue,
    tertiaryContainer: LightStyleConstants.charcoalTint3,
    background: LightStyleConstants.white,
    onBackground: LightStyleConstants.transparent,
    secondary: LightStyleConstants.charcoalTint3,
    secondaryContainer: Colors.black,
    onSecondary: LightStyleConstants.charcoalTint2,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: LightStyleConstants.white,
    elevation: 0,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  extensions: [
    AppMenuItemStyles.light(),
    SignOutAnimationStyles(
      begin: Colors.indigo[100] ?? Colors.white,
      end: Colors.orange[400] ?? Colors.black,
    ),
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
    button: TextStyle(color: Colors.white, fontSize: 14),
  ),
);
