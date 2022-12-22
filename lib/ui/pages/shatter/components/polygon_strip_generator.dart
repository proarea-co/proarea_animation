import 'dart:math';
import 'dart:ui';

import 'triangle.dart';

class PolygonStripGenerator {
  static List<List<Offset>> generate({int seed = 2, int complexity = 2}) {
    final random = Random(2);

    var triangles = [
      Triangle(const Offset(0, 0), const Offset(0, 1), const Offset(1, 0)),
      Triangle(const Offset(1, 1), const Offset(0, 1), const Offset(1, 0)),
    ];

    for (int i = 0; i < complexity;i++) {
      triangles = triangles.expand((t) => t.shatter(random)).toList();
    }

    return triangles.map((t) => [t.p1, t.p2, t.p3]).toList();
  }
}
