import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/settings/settings_cubit.dart';
import '../../../di/di.dart';
import '../../views/base_builders/app_consumer.dart';

class SettingsPage extends StatelessWidget with AutoRouteWrapper {
  const SettingsPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<SettingsCubit>(
      create: (_) => locator(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppConsumer<SettingsCubit, SettingsState>(
      builder: (state) {
        return Container();
      },
    );
  }
}
