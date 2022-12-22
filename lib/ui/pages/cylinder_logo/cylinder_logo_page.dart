import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../../../themes/theme_app.dart';
import 'components/linear_text.dart';

class CylinderLogoPage extends StatefulWidget {
  const CylinderLogoPage({super.key});

  @override
  State<CylinderLogoPage> createState() => _CylinderLogoPageState();
}

class _CylinderLogoPageState extends State<CylinderLogoPage>
    with SingleTickerProviderStateMixin {
  static const _count = 16;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  double get _pi => math.pi;

  double _getRotation(int index) {
    final rotationValue = _animationController.value * 2 * _pi / _count;
    final rotation = 2 * _pi * index / _count + _pi / 2 + rotationValue;

    if (!_isOnLeft(rotation)) return rotation;

    return -rotation + 2 * rotationValue - _pi * 2 / _count;
  }

  bool _isOnLeft(double rotation) => math.cos(rotation) > 0;

  Matrix4 _getTransform(int index) {
    return Matrix4.identity()
      ..setEntry(3, 2, 0.001)
      ..rotateY(_getRotation(index))
      ..translate(-120.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: SizedBox.expand(
        child: Stack(
          alignment: Alignment.center,
          children: List.generate(_count, (index) => _buildAnimatedUnit(index)),
        ),
      ),
    );
  }

  Widget _buildAnimatedUnit(int index) {
    return AnimatedBuilder(
      animation: _animationController,
      child: const LinearText(),
      builder: (context, child) {
        return Transform(
          alignment: Alignment.center,
          transform: _getTransform(index),
          child: const LinearText(),
        );
      },
    );
  }
}
