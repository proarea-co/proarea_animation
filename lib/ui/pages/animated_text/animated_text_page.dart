import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/animated_text/animated_text_cubit.dart';
import '../../../di/di.dart';
import '../../../mock/animated_texts_mock.dart';
import '../../views/base_builders/app_consumer.dart';

class AnimatedTextPage extends StatelessWidget with AutoRouteWrapper {
  const AnimatedTextPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<AnimatedTextCubit>(
      create: (_) {
        return locator()..setLength(AnimatedTextsMock.animatedTexts().length);
      },
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppConsumer<AnimatedTextCubit, AnimatedTextState>(
      withoutScaffold: true,
      builder: (state) {
        final text = AnimatedTextsMock.animatedTexts()[state.index];
        return Theme(
          data: ThemeData.light(),
          child: Scaffold(
            body: Container(
              decoration: BoxDecoration(color: text.color),
              constraints: const BoxConstraints.expand(),
              child: Center(
                key: ValueKey(text.label),
                child: text.child,
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: context.read<AnimatedTextCubit>().next,
              tooltip: 'Next',
              backgroundColor: Colors.purple,
              child: const Icon(
                Icons.play_circle_filled,
                size: 50.0,
              ),
            ),
          ),
        );
      },
    );
  }
}
