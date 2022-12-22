import 'package:flutter/material.dart';

class PolygonClipper extends CustomClipper<Path> {
  final List<Offset> points;

  const PolygonClipper({this.points = const []});

  @override
  Path getClip(Size size) {
    return Path()
      ..addPolygon(
        points.map((relativeOffset) {
          return Offset(
            relativeOffset.dx * size.width,
            relativeOffset.dy * size.height,
          );
        }).toList(),
        true,
      );
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
