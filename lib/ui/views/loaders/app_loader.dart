import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../gen/assets.gen.dart';
import '../../../themes/app_theme.dart';

class AppLoader extends StatelessWidget {
  final double size;
  final bool withBackground;

  const AppLoader({
    Key? key,
    this.size = 56,
    this.withBackground = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(360),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
        child: Container(
          padding: EdgeInsets.all(size * 0.5),
          color: withBackground ? context.colorScheme.tertiaryContainer : null,
          child: AppLottieLoader(size: size),
        ),
      ),
    );
  }
}

class AppLottieLoader extends StatelessWidget {
  final double? size;
  final Animation<double>? controller;
  final String? asset;

  const AppLottieLoader({
    super.key,
    this.size,
    this.controller,
    this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      asset ?? Assets.lottie.scooter,
      width: size,
      height: size,
      controller: controller,
    );
  }
}
