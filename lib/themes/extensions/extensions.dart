import 'package:flutter/material.dart';

@immutable
class AppMenuItemStyles extends ThemeExtension<AppMenuItemStyles> {
  final LinearGradient gradient;
  final Color selectedColor;
  final Color unSelectedColor;
  final Color backgroundColor;

  const AppMenuItemStyles._({
    required this.gradient,
    required this.selectedColor,
    required this.unSelectedColor,
    required this.backgroundColor,
  });

  factory AppMenuItemStyles.dark() {
    return const AppMenuItemStyles._(
      gradient: LinearGradient(
        colors: [
          Color(0xFF6A00FC),
          Color(0xFF6E02F5),
          Color(0xFF7B06E0),
          Color(0xFF8F0EBF),
          Color(0xFFAB1891),
          Color(0xFFCF2557),
          Color(0xFFEE3024),
          Color(0xFFFDC70C),
        ],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        stops: [0.05, 0.08, 0.1, 0.15, 0.2, 0.3, 0.55, 0.8],
      ),
      selectedColor: Color(0xFF373737),
      unSelectedColor: Color(0xFF212121),
      backgroundColor: Color(0xFF212121),
    );
  }
  factory AppMenuItemStyles.light() {
    return const AppMenuItemStyles._(
      gradient: LinearGradient(
        colors: [
          Color(0xFF6A00FC),
          Color(0xFF6E02F5),
          Color(0xFF7B06E0),
          Color(0xFF8F0EBF),
          Color(0xFFAB1891),
          Color(0xFFCF2557),
          Color(0xFFEE3024),
          Color(0xFFFDC70C),
        ],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        stops: [0.05, 0.08, 0.1, 0.15, 0.2, 0.3, 0.55, 0.8],
      ),
      selectedColor: Color(0xFF373737),
      unSelectedColor: Color(0xFF212121),
      backgroundColor: Color(0xFF212121),
    );
  }

  @override
  ThemeExtension<AppMenuItemStyles> lerp(
      ThemeExtension<AppMenuItemStyles>? other, double t) {
    if (other is! AppMenuItemStyles) {
      return this;
    }
    return copyWith(
      gradient: LinearGradient.lerp(gradient, other.gradient, t),
      selectedColor: Color.lerp(selectedColor, other.selectedColor, t),
      unSelectedColor: Color.lerp(unSelectedColor, other.unSelectedColor, t),
      backgroundColor: Color.lerp(unSelectedColor, other.unSelectedColor, t),
    );
  }

  @override
  ThemeExtension<AppMenuItemStyles> copyWith({
    LinearGradient? gradient,
    Color? selectedColor,
    Color? unSelectedColor,
    Color? backgroundColor,
  }) {
    return AppMenuItemStyles._(
      gradient: gradient ?? this.gradient,
      selectedColor: selectedColor ?? this.selectedColor,
      unSelectedColor: unSelectedColor ?? this.unSelectedColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }
}
