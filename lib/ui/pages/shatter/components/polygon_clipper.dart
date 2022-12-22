import 'package:flutter/material.dart';

class PolygonClipper extends CustomClipper<Path> {
  final List<Offset> points;

  const PolygonClipper({this.points = const []});

  @override
  Path getClip(Size size) {
    return Path()
      ..addPolygon(
        points.map((relativeOffset) => _pointBySize(size, relativeOffset)).toList(),
        true,
      );
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;

  Offset _pointBySize(Size size, Offset offset) {
    return Offset(
      offset.dx * size.width,
      offset.dy * size.height,
    );
  }

}
