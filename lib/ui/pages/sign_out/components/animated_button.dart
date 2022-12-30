import 'package:flutter/material.dart';

import '../../../../l10n/localization_helper.dart';
import '../../../../themes/app_theme.dart';

class AnimatedButton extends StatelessWidget {
  final Animation<double> controller;
  final Animation<double> opacity;
  final Animation<double> width;
  final Animation<double> height;
  final Animation<BorderRadius?> borderRadius;
  final Animation<Color?> color;
  final Animation<AlignmentGeometry> alignment;
  final Color begin;
  final Color end;

  static double _getX(int radius) {
    final mod = radius % 90;
    final result = mod / 90;
    if (radius < 90) return -1 + result;

    if (radius < 180) return result;

    if (radius < 270) return 1 - result;

    if (radius < 360) return -result;

    return 0;
  }

  static double _getY(int radius) {
    final mod = radius % 90;
    final result = mod / 90;
    if (radius < 90) return -result;

    if (radius < 180) return -1 + result;

    if (radius < 270) return result;

    if (radius < 360) return 1 - result;

    return 0;
  }

  AnimatedButton({
    super.key,
    required this.controller,
    required this.begin,
    required this.end,
  })  : opacity = Tween<double>(
          begin: 0.5,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.0,
              1,
              curve: Curves.ease,
            ),
          ),
        ),
        width = Tween<double>(
          begin: 80.0,
          end: 160.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.2,
              0.4,
              curve: Curves.ease,
            ),
          ),
        ),
        height = Tween<double>(begin: 50.0, end: 160.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.3,
              0.5,
              curve: Curves.ease,
            ),
          ),
        ),
        borderRadius = BorderRadiusTween(
          begin: BorderRadius.circular(4),
          end: BorderRadius.circular(90),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.4,
              0.6,
              curve: Curves.ease,
            ),
          ),
        ),
        color = ColorTween(
          begin: begin,
          end: end,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.250,
              0.7,
              curve: Curves.ease,
            ),
          ),
        ),
        alignment = TweenSequence(
          <TweenSequenceItem<AlignmentGeometry>>[
            TweenSequenceItem<AlignmentGeometry>(
              tween: Tween<AlignmentGeometry>(
                begin: const Alignment(0, 0),
                end: const Alignment(-1, 0),
              ).chain(CurveTween(curve: Curves.ease)),
              weight: 40.0,
            ),
            for (int i = 0; i < 359; i++)
              TweenSequenceItem<AlignmentGeometry>(
                tween: Tween<AlignmentGeometry>(
                  begin: Alignment(_getX(i), _getY(i)),
                  end: Alignment(_getX(i + 1), _getY(i + 1)),
                ).chain(CurveTween(curve: Curves.ease)),
                weight: 40.0 / 60,
              ),
          ],
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.35, 1.0),
          ),
        );

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Align(
      alignment: alignment.value,
      child: Opacity(
        opacity: opacity.value,
        child: Container(
          width: width.value,
          height: height.value,
          decoration: BoxDecoration(
            color: color.value,
            border: Border.all(
              color: context.colorScheme.onTertiary,
              width: 2.0,
            ),
            borderRadius: borderRadius.value,
          ),
          child: Center(
            child: Text(
              context.strings.signOut,
              style: context.textTheme.button,
            ),
          ),
        ),
      ),
    );
  }
}
