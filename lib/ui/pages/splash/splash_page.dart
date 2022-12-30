import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../../../bloc/splash/splash_cubit.dart';
import '../../../di/di.dart';
import '../../../gen/assets.gen.dart';
import '../../../l10n/localization_helper.dart';
import '../../../routes/router.dart';
import '../../../themes/app_theme.dart';
import '../../views/base_builders/app_consumer.dart';

class SplashPage extends StatelessWidget with AutoRouteWrapper {
  const SplashPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (_) => locator()..init(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppConsumer<SplashCubit, SplashState>(
        withScaffold: false,
        listenDefault: (context, state) {
          if (state is! SplashLoaded) return;
          context.router.replace(const HomeRoute());
        },
        builder: (state) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(Assets.lottie.scooter),
                _buildLoadingLabile(context),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoadingLabile(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          context.strings.loading,
          style: context.textTheme.headline5,
        ),
        const SizedBox(width: 4),
        JumpingDotsProgressIndicator(
          fontSize: 20.0,
          color: context.colorScheme.onPrimary,
        ),
      ],
    );
  }
}
