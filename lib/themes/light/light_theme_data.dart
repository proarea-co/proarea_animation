part of '../theme_app.dart';

final _lightThemeData = ThemeData(
  primaryColor: LightStyleConstants.charcoal,
  unselectedWidgetColor: LightStyleConstants.charcoalTint3,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    iconTheme: IconThemeData(
      color: LightStyleConstants.white,
      size: 18,
    ),
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontFamily: 'Manrope',
      fontSize: 20,
      color: LightStyleConstants.whiteShade,
    ),
    backgroundColor: LightStyleConstants.charcoal,
  ),
  buttonTheme: ButtonThemeData(
    colorScheme: _colorSchemeLight,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 4,
      primary: _colorSchemeLight.primary,
      backgroundColor: _colorSchemeLight.surface,
      side: BorderSide(
        color: _colorSchemeLight.surface,
        width: 0,
      ),
      shadowColor: _colorSchemeLight.background,
      padding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: _colorSchemeLight.surface,
          width: 0,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),
  colorScheme: _colorSchemeLight,
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
      fontFamily: 'Manrope',
      fontSize: 32,
      height: 36 / 34,
      color: LightStyleConstants.electricBlueShade,
    ),
    headline2: TextStyle(
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontFamily: 'Manrope',
      fontSize: 30,
      letterSpacing: 32 / 30,
      color: LightStyleConstants.charcoal,
    ),
    headline3: TextStyle(
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontFamily: 'Manrope',
      fontSize: 28,
      letterSpacing: 30 / 28,
      color: LightStyleConstants.charcoal,
    ),
    headline4: TextStyle(
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontFamily: 'Manrope',
      fontSize: 26,
      letterSpacing: 28 / 26,
      color: LightStyleConstants.white,
    ),
    headline5: TextStyle(
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'Manrope',
      fontSize: 24,
      letterSpacing: 26 / 24,
      color: LightStyleConstants.white,
    ),
    headline6: TextStyle(
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontFamily: 'Manrope',
      fontSize: 20,
      height: 24 / 20,
      letterSpacing: .15,
      color: LightStyleConstants.white,
    ),
    subtitle1: TextStyle(
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontFamily: 'Manrope',
      fontSize: 18,
      height: 24 / 16,
      letterSpacing: .15,
      color: LightStyleConstants.charcoal,
    ),
    subtitle2: TextStyle(
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontFamily: 'Manrope',
      fontSize: 14,
      height: 24 / 14,
      letterSpacing: .1,
      color: LightStyleConstants.charcoal,
    ),
    bodyText1: TextStyle(
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'Manrope',
      fontSize: 16,
      height: 24 / 16,
      letterSpacing: .5,
      color: LightStyleConstants.charcoal,
    ),
    bodyText2: TextStyle(
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'Manrope',
      fontSize: 14,
      height: 20 / 14,
      letterSpacing: .25,
      color: LightStyleConstants.charcoalTint3,
    ),
    caption: TextStyle(
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontFamily: 'Manrope',
      fontSize: 14,
      height: 16 / 12,
      letterSpacing: .25,
      color: LightStyleConstants.charcoal,
    ),
    button: TextStyle(
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontFamily: 'Manrope',
      fontSize: 16,
      height: 18 / 16,
      letterSpacing: 1.25,
      color: LightStyleConstants.whiteShade,
    ),
    overline: TextStyle(
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontFamily: 'Manrope',
      fontSize: 10,
      height: 16 / 10,
      letterSpacing: 1.5,
      color: LightStyleConstants.charcoalTint3,
    ),
  ),
  scaffoldBackgroundColor: LightStyleConstants.white,
  dividerColor: LightStyleConstants.charcoal,
  backgroundColor: LightStyleConstants.white,
  canvasColor: LightStyleConstants.white,
);

const _colorSchemeLight = ColorScheme(
  brightness: Brightness.dark,
  primary: LightStyleConstants.charcoal,
  onPrimary: LightStyleConstants.charcoalTint5,
  primaryContainer: LightStyleConstants.charcoalTint4,
  onPrimaryContainer: LightStyleConstants.charcoalTint6,
  secondary: LightStyleConstants.electricBlue,
  onSecondary: LightStyleConstants.electricBlueTint,
  secondaryContainer: LightStyleConstants.electricBlueTint3,
  error: LightStyleConstants.error,
  onError: LightStyleConstants.errorTint1,
  background: LightStyleConstants.whiteShade,
  onBackground: LightStyleConstants.charcoalTint3,
  surface: LightStyleConstants.white,
  onSurface: LightStyleConstants.charcoalTint1,
  surfaceVariant: LightStyleConstants.charcoalTint2,
  inversePrimary: LightStyleConstants.aquamarineShade,
  errorContainer: LightStyleConstants.radical,
  tertiary: LightStyleConstants.aquamarine,
);
