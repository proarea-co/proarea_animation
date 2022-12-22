import 'dart:math';
import 'dart:ui';

class Triangle {
  final Offset p1;
  final Offset p2;
  final Offset p3;

  Triangle(this.p1, this.p2, this.p3);

  List<Triangle> shatter(Random random) {
    var m12 = _average2(p1, p2, 0.4 + 0.2 * random.nextDouble());
    var m23 = _average2(p2, p3, 0.4 + 0.2 * random.nextDouble());
    var m13 = _average2(p1, p3, 0.4 + 0.2 * random.nextDouble());
    var center = _average3(
      p1,
      p2,
      p3,
      0.3 * random.nextDouble(),
      0.3 * random.nextDouble(),
      0.3 * random.nextDouble(),
    );

    return [
      Triangle(p1, m12, center),
      Triangle(m12, p2, center),
      Triangle(p2, m23, center),
      Triangle(m23, p3, center),
      Triangle(p3, m13, center),
      Triangle(m13, p1, center),
    ];
  }

  Offset _average2(Offset p1, Offset p2, double weight) {
    var vec = Offset(
      p2.dx - p1.dx,
      p2.dy - p1.dy,
    );

    return Offset(
      p1.dx + vec.dx * weight,
      p1.dy + vec.dy * weight,
    );
  }

  Offset _average3(
      Offset p1, Offset p2, Offset p3, double w1, double w2, double w3) {
    var center = Offset(
      (p1.dx + p2.dx + p3.dx) / 3.0,
      (p1.dy + p2.dy + p3.dy) / 3.0,
    );

    var vec1 = Offset(p1.dx - center.dx, p1.dy - center.dy);
    var vec2 = Offset(p2.dx - center.dx, p2.dy - center.dy);
    var vec3 = Offset(p3.dx - center.dx, p3.dy - center.dy);

    return Offset(
      center.dx + vec1.dx * w1 + vec2.dx * w2 + vec3.dx * w3,
      center.dy + vec1.dy * w1 + vec2.dy * w2 + vec3.dy * w3,
    );
  }
}