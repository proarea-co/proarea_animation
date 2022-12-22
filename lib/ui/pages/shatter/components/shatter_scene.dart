import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged_dart/supercharged_dart.dart';

import 'animated_shatter.dart';
import 'polygon_strip_generator.dart';

class ShatterScene extends StatefulWidget {
  final Widget Function(
    BuildContext context,
    void Function() startScatter,
  ) builder;

  const ShatterScene({
    super.key,
    required this.builder,
  });

  @override
  State<ShatterScene> createState() => _ShatterSceneState();
}

class _ShatterSceneState extends State<ShatterScene> {
  final _key = GlobalKey();
  bool _showAnimation = false;
  bool _useFallback = false;
  MemoryImage? _memoryImage;
  late List<List<Offset>> _parts;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _recordImage());
  }

  void _recordImage() async {
    try {
      var boundary =
          _key.currentContext?.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage();
      var byteData = await image.toByteData(format: ImageByteFormat.png);
      var imageBytes = byteData?.buffer.asUint8List();
      if (imageBytes == null) return;

      setState(() {
        _parts = PolygonStripGenerator.generate();
        _memoryImage = MemoryImage(imageBytes);
      });
    } catch (e) {
      setState(() {
        _parts = PolygonStripGenerator.generate(complexity: 1);
        _useFallback = true;
      });
    }
  }

  void _startShatter() {
    setState(() {
      _showAnimation = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_showAnimation) {
      return Stack(
        children: [
          if (_memoryImage != null)
            Positioned.fill(
              child: Opacity(opacity: 0.0, child: Image(image: _memoryImage!)),
            ),
          Positioned.fill(
            child: RepaintBoundary(
              key: _key,
              child: widget.builder(context, _startShatter),
            ),
          ),
        ],
      );
    }

    return PlayAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: 1200.milliseconds,
      curve: Curves.easeInSine,
      builder: (context, value, child) {
        return Stack(
          children: _parts.map((part) {
            return _buildPart(value, part);
          }).toList(),
        );
      },
    );
  }

  Widget _buildPart(double progress, List<Offset> part) {
    return Positioned.fill(
      child: AnimatedShatter(
        points: part,
        progress: progress,
        child: !_useFallback
            ? Image(image: _memoryImage!)
            : widget.builder(context, () {}),
      ),
    );
  }
}
