import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/app_controller/app_controller_cubit.dart';
import 'bloc/base/base_cubit.dart';
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
    return BlocConsumer<AppControllerCubit, AppControllerState>(
      listener: (context, state) {
        final isError = state.status == StateStatus.error;
        final isInfo = state.status == StateStatus.info;

        if (isError) showSnackBar(context, state.massage, error: true);

        if (isInfo) showSnackBar(context, state.massage);
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
    );
  }
}
