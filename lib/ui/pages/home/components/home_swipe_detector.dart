import 'package:flutter/material.dart';

class HomeSwipeDetector extends StatefulWidget {
  final ValueChanged<bool> setCanBeDragged;
  final AnimationController animationController;
  final bool canBeDragged;
  final Widget child;

  const HomeSwipeDetector({
    super.key,
    required this.setCanBeDragged,
    required this.animationController,
    required this.child,
    this.canBeDragged = true,
  });

  @override
  State<HomeSwipeDetector> createState() => _HomeSwipeDetectorState();
}

class _HomeSwipeDetectorState extends State<HomeSwipeDetector> {
  AnimationController get _controller => widget.animationController;

  double get _width => MediaQuery.of(context).size.width;

  void _onDragStart(DragStartDetails details) {
    final openLeft =
        _controller.isDismissed && details.globalPosition.dx < _width * 0.4;

    final openRight =
        _controller.isCompleted && details.globalPosition.dx > _width * 0.6;

    final canBeDragged = openRight || openLeft;

    widget.setCanBeDragged(canBeDragged);
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (!widget.canBeDragged) return;

    final delta = (details.primaryDelta ?? 0) / _width * 1.2;
    _controller.value += delta;
  }

  void _onDragEnd(DragEndDetails details) {
    if (_controller.isDismissed || _controller.isCompleted) return;

    if (details.velocity.pixelsPerSecond.dx.abs() >= _width) {
      final speed = details.velocity.pixelsPerSecond.dx / _width * 0.9;
      _controller.fling(velocity: speed);
      return;
    }

    if (_controller.value < 0.5) {
      _controller.forward();
      return;
    }

    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragEnd: _onDragEnd,
      onHorizontalDragUpdate: _onDragUpdate,
      child: widget.child,
    );
  }
}
