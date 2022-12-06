import 'package:flutter/material.dart';

class FadeInItemView extends StatefulWidget {
  final Widget child;

  const FadeInItemView({
    super.key,
    required this.child,
  });

  @override
  State<FadeInItemView> createState() => FadeInItemViewState();
}

class FadeInItemViewState extends State<FadeInItemView>
    with SingleTickerProviderStateMixin {
  //1 means its below, -1 means its above
  late bool _show = true;
  late AnimationController _animationController;
  late Animation<double> _animation;

  int get position => _show ? 1 : -1;

  void show() {
    setState(() => _show = true);
    _animationController.forward();
  }

  void hide() {
    setState(() => _show = false);
    _animationController.reverse();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 64 * position * (1 - _animation.value)),
          child: Opacity(
            opacity: _animation.value,
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}
