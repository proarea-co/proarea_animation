import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../base/bloc/base_cubit.dart';
import '../../models/tab_item/tab_item.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends BaseCubit<HomeState> {
  late AnimationController _animationController;
  late Animation<double> _animation;

  HomeCubit() : super(const HomeState());

  @override
  void handleError(String massage) {
    emit(state.copyWith(
      status: StateStatus.error,
      message: massage,
    ));
  }

  @override
  Future<void> close() {
    _animationController.dispose();
    return super.close();
  }

  Animation<double> get animation => _animation;
  AnimationController get controller => _animationController;
  bool get fullScreen => controller.value == 0;

  void setTabs(List<TabItem>? tabs) {
    emit(state.copyWith(tabs: tabs));
  }

  void setController(AnimationController animationController) {
    _animationController = animationController;

    _animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );
  }

  void _setCanBeDragged(bool? canBeDragged) {
    emit(state.copyWith(canBeDragged: canBeDragged));
  }

  Future<void> toggleAnimation() {
    return _animationController.isDismissed
        ? _animationController.forward()
        : _animationController.reverse();
  }

  void onDragStart(BuildContext context, DragStartDetails details) {
    log('${MediaQuery.of(context).size.width * 0.4}');
    bool isDragOpenFromLeft = _animationController.isDismissed &&
        details.globalPosition.dx < MediaQuery.of(context).size.width * 0.4;
    bool isDragClosedFromRight = _animationController.isCompleted &&
        details.globalPosition.dx > MediaQuery.of(context).size.width * 0.6;
    final canBeDragged = isDragClosedFromRight || isDragOpenFromLeft;
    _setCanBeDragged(canBeDragged);
  }

  void onDragUpdate(BuildContext context, DragUpdateDetails details) {
    final canBeDragged = state.canBeDragged;
    if (canBeDragged) {
      double delta =
          (details.primaryDelta ?? 0) / MediaQuery.of(context).size.width * 1.2;
      _animationController.value += delta;
    }
  }

  void onDragEnd(BuildContext context, DragEndDetails details) {
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

  double getSlide(BuildContext context) {
    final rightSlide = MediaQuery.of(context).size.width * 0.6;
    return rightSlide * _animationController.value;
  }

  double get scale {
    return 1 - (controller.value * 0.12);
  }
}
