import 'package:flutter/material.dart';

class SignOutAnimationStyles extends ThemeExtension<SignOutAnimationStyles> {
  final Color begin;
  final Color end;

  const SignOutAnimationStyles({
    this.begin = Colors.white,
    this.end = Colors.black,
  });

  @override
  ThemeExtension<SignOutAnimationStyles> copyWith({
    Color? begin,
    Color? end,
  }) {
    return SignOutAnimationStyles(
      begin: begin ?? this.begin,
      end: end ?? this.end,
    );
  }

  @override
  ThemeExtension<SignOutAnimationStyles> lerp(
      ThemeExtension<SignOutAnimationStyles>? other, double t) {
    if (other is! SignOutAnimationStyles) {
      return this;
    }
    return copyWith(
      begin: Color.lerp(begin, other.begin, t),
      end: Color.lerp(end, other.end, t),
    );
  }
}
