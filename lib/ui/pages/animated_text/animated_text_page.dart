import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/animated_text/animated_text_cubit.dart';
import '../../../di/di.dart';
import '../../../l10n/localization_helper.dart';
import '../../../mock/animated_texts_mock.dart';
import '../../../themes/theme_app.dart';
import '../../views/base_builders/app_consumer.dart';

class AnimatedTextPage extends StatelessWidget with AutoRouteWrapper {
  const AnimatedTextPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    final length = AnimatedTextsMock.animatedTexts().length;
    return BlocProvider<AnimatedTextCubit>(
      create: (_) => locator()..setLength(length),
      child: Theme(
        data: ThemeType.light.themeData,
        child: this,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppConsumer<AnimatedTextCubit, AnimatedTextState>(
      withoutScaffold: true,
      builder: (state) {
        final text = AnimatedTextsMock.animatedTexts()[state.index];
        return Scaffold(
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
            tooltip: context.strings.next,
            backgroundColor: context.colorScheme.tertiary,
            foregroundColor: context.colorScheme.onPrimary,
            child: const Icon(
              Icons.play_circle_filled,
              size: 50.0,
            ),
          ),
        );
      },
    );
  }
}
