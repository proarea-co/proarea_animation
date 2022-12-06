import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import 'shatter_scene.dart';

class ShatterView extends StatefulWidget {
  final Widget child;
  final Widget Function(void Function() onPressed) widgetBuilder;
  final VoidCallback? onComplete;

  const ShatterView({
    super.key,
    required this.child,
    required this.widgetBuilder,
    this.onComplete,
  });

  @override
  State<ShatterView> createState() => _ShatterViewState();
}

class _ShatterViewState extends State<ShatterView> {
  var _animationControlStatus = Control.stop;
  var tween = MovieTween();
  void _start(Function shatterFn) async {
    setState(
      () => _animationControlStatus = Control.playFromStart,
    );
    shatterFn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAnimationBuilder<Movie>(
        control: _animationControlStatus,
        tween: tween,
        duration: tween.duration,
        builder: (context, child, value) {
          return Container(
            color: Colors.black,
            child: Stack(
              children: [
                Positioned.fill(
                  child: widget.child,
                ),
                Positioned.fill(
                  child: ShatterScene(
                    builder: (context, shatterFn) =>
                        widget.widgetBuilder(() => _start(shatterFn)),
                  ),
                ),
              ],
            ),
          );
        },
        animationStatusListener: (status) {
          if (status == AnimationStatus.completed) {
            widget.onComplete?.call();
          }
        },
      ),
    );
  }
}