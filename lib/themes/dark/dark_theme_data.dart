part of '../theme_app.dart';

final _darkThemeData = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: DarkStyleConstants.charcoal,
    onPrimary: DarkStyleConstants.white,
    tertiary: DarkStyleConstants.blue,
    onTertiary: DarkStyleConstants.purple,
    tertiaryContainer: LightStyleConstants.charcoalTint1,
    onBackground: DarkStyleConstants.transparent,
    secondary: DarkStyleConstants.charcoalTint3,
    onSecondary: DarkStyleConstants.charcoalTint2,
  ),
  primarySwatch: Colors.red,
  extensions: [
    AppMenuItemStyles.dark(),
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
