import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../l10n/localization_helper.dart';
import '../../../../models/post.dart';
import '../../../../themes/theme_app.dart';

class PostItemView extends StatefulWidget {
  final int index;
  final Post post;
  final double animationControllerValue;
  final VoidCallback onRemoveTap;

  const PostItemView({
    super.key,
    required this.index,
    required this.post,
    required this.onRemoveTap,
    this.animationControllerValue = 1,
  });

  @override
  State<PostItemView> createState() => _ListItemState();
}

class _ListItemState extends State<PostItemView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      value: widget.animationControllerValue,
      duration: const Duration(milliseconds: 300),
    );
  }

  void _onDragUpdate(DragUpdateDetails details) {
    double delta =
        (details.primaryDelta ?? 0) / MediaQuery.of(context).size.width;
    _animationController.value += delta;
  }

  void _onDragEnd(DragEndDetails details) {
    if (_animationController.isDismissed || _animationController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >=
        MediaQuery.of(context).size.width * 0.75) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;
      _animationController.fling(velocity: visualVelocity);
    } else if (_animationController.value > 0.5) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: _onDragEnd,
      onHorizontalDragUpdate: _onDragUpdate,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Stack(
            children: [
              _buildFrontSide(),
              _buildBackSide(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBackSide() {
    final slideDistance = MediaQuery.of(context).size.width;
    return Transform.translate(
      offset: Offset(slideDistance * _animationController.value, 0),
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(-math.pi / 2 * _animationController.value),
        alignment: Alignment.centerLeft,
        child: Container(
          height: 80,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(top: 2),
          decoration: BoxDecoration(
            color: context.colorScheme.error,
            boxShadow: [
              BoxShadow(
                color: context.colorScheme.tertiary,
                blurRadius: 2,
                spreadRadius: 2,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildRemoveButton(),
              _buildEditButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFrontSide() {
    final slideDistance = MediaQuery.of(context).size.width;
    return Transform.translate(
      offset: Offset(slideDistance * (_animationController.value - 1), 0),
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(
            math.pi / 2 * (1 - _animationController.value),
          ),
        alignment: Alignment.centerRight,
        child: Container(
          height: 80,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(top: 2),
          decoration: BoxDecoration(
            color: context.colorScheme.background,
            boxShadow: [
              BoxShadow(
                color: context.colorScheme.tertiary,
                blurRadius: 2,
                spreadRadius: 2,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.post.title,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditButton() {
    return Expanded(
      child: InkWell(
        child: Column(
          children: [
            Icon(
              Icons.edit_outlined,
              color: context.colorScheme.surface,
            ),
            const SizedBox(height: 4),
            Text(
              context.strings.edit,
              style: context.textTheme.headline1,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRemoveButton() {
    return Expanded(
      child: InkWell(
        onTap: widget.onRemoveTap,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.delete_outline,
              color: context.colorScheme.surface,
            ),
            const SizedBox(height: 4),
            Text(
              context.strings.remove,
              style: context.textTheme.headline1,
            ),
          ],
        ),
      ),
    );
  }
}
