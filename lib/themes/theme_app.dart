import 'package:flutter/material.dart';

import '../gen/fonts.gen.dart';
import '../l10n/localization_helper.dart';
import 'constants/dark_style_constants.dart';
import 'constants/light_style_constants.dart';
import 'extensions/app_menu_item_styles.dart';
import 'extensions/sign_out_animation_styles.dart';

part 'dark/dark_theme_data.dart';
part 'light/light_theme_data.dart';

enum ThemeType {
  light,
  dark;

  static final themeDataMap = {
    ThemeType.dark: _darkThemeData,
    ThemeType.light: _lightThemeData,
  };

  String getLocalizedName(BuildContext context) {
    final themeToNameMap = {
      ThemeType.light: context.strings.light,
      ThemeType.dark: context.strings.dark,
    };
    return themeToNameMap[this]!;
  }

  static final labelToEnumMap = {
    ThemeType.dark.name: ThemeType.dark,
    ThemeType.light.name: ThemeType.light,
  };

  static ThemeType fromString(String text) {
    return labelToEnumMap[text] ?? ThemeType.light;
  }

  ThemeData get themeData => themeDataMap[this]!;
}

extension BuildContextExt on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  T? extension<T>() => Theme.of(this).extension<T>();
}
