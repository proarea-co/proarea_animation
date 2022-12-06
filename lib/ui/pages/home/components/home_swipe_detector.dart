import 'dart:developer';

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
  AnimationController get _animationController => widget.animationController;

  void _onDragStart(DragStartDetails details) {
    log('${MediaQuery.of(context).size.width * 0.4}');
    bool isDragOpenFromLeft = _animationController.isDismissed &&
        details.globalPosition.dx < MediaQuery.of(context).size.width * 0.4;
    bool isDragClosedFromRight = _animationController.isCompleted &&
        details.globalPosition.dx > MediaQuery.of(context).size.width * 0.6;
    final canBeDragged = isDragClosedFromRight || isDragOpenFromLeft;
    widget.setCanBeDragged(canBeDragged);
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (widget.canBeDragged) {
      double delta =
          (details.primaryDelta ?? 0) / MediaQuery.of(context).size.width * 1.2;
      _animationController.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if (_animationController.isDismissed || _animationController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >=
        MediaQuery.of(context).size.width) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width *
          0.9;
      _animationController.fling(velocity: visualVelocity);
    } else if (_animationController.value < 0.5) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
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
