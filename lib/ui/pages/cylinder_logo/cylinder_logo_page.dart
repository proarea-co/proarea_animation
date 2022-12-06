import 'dart:math' as math;
import 'package:flutter/material.dart';

import 'components/linear_text.dart';

class CylinderLogoPage extends StatefulWidget {
  const CylinderLogoPage({super.key});

  @override
  State<CylinderLogoPage> createState() => _CylinderLogoPageState();
}

class _CylinderLogoPageState extends State<CylinderLogoPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final _numberOfTexts = 16;

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

  bool isOnLeft(double rotation) => math.cos(rotation) > 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox.expand(
        child: Stack(
          alignment: Alignment.center,
          children: List.generate(
            _numberOfTexts,
            (index) {
              return AnimatedBuilder(
                animation: _animationController,
                child: const LinearText(),
                builder: (context, child) {
                  final animationRotationValue =
                      _animationController.value * 2 * math.pi / _numberOfTexts;
                  double rotation = 2 * math.pi * index / _numberOfTexts +
                      math.pi / 2 +
                      animationRotationValue;
                  if (isOnLeft(rotation)) {
                    rotation = -rotation +
                        2 * animationRotationValue -
                        math.pi * 2 / _numberOfTexts;
                  }
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(rotation)
                      ..translate(-120.0),
                    child: const LinearText(),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
