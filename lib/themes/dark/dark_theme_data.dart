part of '../app_theme.dart';

final _darkThemeData = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  colorScheme: const ColorScheme.dark(
    primary: DarkStyleConstants.white,
    onPrimary: DarkStyleConstants.charcoal,
    tertiary: DarkStyleConstants.blue,
    onTertiary: DarkStyleConstants.purple,
    tertiaryContainer: LightStyleConstants.charcoalTint1,
    background: DarkStyleConstants.background,
    onBackground: DarkStyleConstants.transparent,
    secondary: DarkStyleConstants.charcoalTint3,
    secondaryContainer: DarkStyleConstants.white,
    onSecondary: DarkStyleConstants.charcoalTint2,
    surfaceVariant: DarkStyleConstants.charcoalTint3,
    primaryContainer: DarkStyleConstants.white,
    onPrimaryContainer: DarkStyleConstants.charcoalTint1,
  ),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    backgroundColor: DarkStyleConstants.background,
    elevation: 0,
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
    bodyText1: TextStyle(color: DarkStyleConstants.charcoal, fontSize: 20),
    bodyText2: TextStyle(color: DarkStyleConstants.white, fontSize: 14),
    headline1: TextStyle(
      color: LightStyleConstants.white,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    button: TextStyle(color: Colors.white, fontSize: 14),
  ),
);
