part of '../theme_app.dart';

final _darkThemeData = ThemeData(
  brightness: Brightness.dark,
  extensions: [
    AppMenuItemStyles.dark(),
  ],
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 64,
      fontFamily: 'Billy',
      fontWeight: FontWeight.w600,
    ),
  ),
);
