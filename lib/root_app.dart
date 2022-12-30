import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'base/bloc/base_cubit.dart';
import 'bloc/app_controller/app_controller_cubit.dart';

import 'di/di.dart';
import 'l10n/localization_helper.dart';
import 'routes/router.dart';
import 'ui/views/snack_bar/show_snack_bar.dart';

class RootApp extends StatelessWidget {
  final AppRouter router;

  const RootApp({
    super.key,
    required this.router,
  });

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (_, __, ___) {
      return BlocProvider<AppControllerCubit>(
        create: (_) => locator()..init(),
        child: BlocConsumer<AppControllerCubit, AppControllerState>(
          listener: (context, state) {
            switch (state.status) {
              case StateStatus.info:
                AppSnackBar.of(context).showSuccess(state.message);
                break;
              case StateStatus.error:
                AppSnackBar.of(context).showError(state.message);
                break;
              default:
                break;
            }
          },
          builder: (context, state) {
            return MaterialApp.router(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              locale: state.locale,
              supportedLocales: AppLocalizations.supportedLocales,
              routerDelegate: router.delegate(),
              routeInformationParser: router.defaultRouteParser(),
              theme: state.themeType.themeData,
            );
          },
        ),
      );
    });
  }
}
