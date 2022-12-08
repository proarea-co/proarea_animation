import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/settings/settings_cubit.dart';
import '../../../di/di.dart';
import '../../../l10n/localization_helper.dart';
import '../../../themes/theme_app.dart';
import '../../views/base_builders/app_consumer.dart';
import 'components/language_card.dart';
import 'components/theme_card.dart';

class SettingsPage extends StatelessWidget with AutoRouteWrapper {
  const SettingsPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<SettingsCubit>(
      create: (_) => locator()..init(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppConsumer<SettingsCubit, SettingsState>(
      builder: (state) {
        return Column(
          children: [
            const SizedBox(height: 16),
            const LanguageCard(),
            const SizedBox(height: 8),
            _buildDivider(),
            const ThemeCard(),
            const SizedBox(height: 8),
            const Spacer(),
            _buildVersion(state),
            const SizedBox(height: 8),
          ],
        );
      },
    );
  }

  Widget _buildDivider() {
    return const Divider(
      height: 36,
      color: Colors.white54,
    );
  }

  Widget _buildVersion(SettingsState state) {
    return Builder(builder: (context) {
      return Text(
        context.strings.version(state.settings.appVersion),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: context.colorScheme.secondary,
        ),
      );
    });
  }
}
