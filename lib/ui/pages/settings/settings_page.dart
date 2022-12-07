import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/settings/settings_cubit.dart';
import '../../../di/di.dart';
import '../../../l10n/localization_helper.dart';
import '../../../routes/router.dart';
import '../../views/base_builders/app_consumer.dart';
import '../../views/buttons/app_button.dart';
import 'components/language_card.dart';
import 'components/theme_card.dart';

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
        return Column(
          children: [
            const SizedBox(height: 16),
            const LanguageCard(),
            const SizedBox(height: 8),
            _buildDivider(),
            const ThemeCard(),
            const SizedBox(height: 8),
            _buildAboutAppButton(context)
          ],
        );
      },
    );
  }

  Widget _buildAboutAppButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: AppButton(
        text: context.strings.aboutApp,
        onPressed: () => context.router.push(const AboutAppRoute()),
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      height: 36,
      color: Colors.white54,
    );
  }
}
