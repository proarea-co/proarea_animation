import 'package:flutter/material.dart';

import 'polygon_clipper.dart';

class AnimatedShatter extends StatelessWidget {
  final double progress;
  final List<Offset> points;
  final Widget child;

  const AnimatedShatter({
    super.key,
    required this.child,
    this.progress = 0,
    this.points = const [],
  });

  @override
  Widget build(BuildContext context) {
    final center = Offset(
      (points[0].dx + points[1].dx + points[2].dx) / 3.0,
      (points[0].dy + points[1].dy + points[2].dy) / 3.0,
    );

    return LayoutBuilder(builder: (context, constraints) {
      final alignment = Alignment(-1 + center.dx * 2, -1 + center.dy * 2);
      final negativity = (alignment.x < 0 ? -1 : 1);
      return Transform.translate(
        offset: Offset(0, progress * constraints.maxHeight * 1.2),
        child: Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.01)
            ..rotateZ(negativity * 0.4 * progress)
            ..rotateX(negativity * 0.3 * progress)
            ..rotateY(negativity * 0.2 * progress),
          alignment: alignment,
          child: Transform.scale(
            scale: 1 - 0.7 * progress,
            alignment: alignment,
            child: ClipPath(
              clipper: PolygonClipper(points: points),
              child: child,
            ),
          ),
        ),
      );
    });
  }
}
