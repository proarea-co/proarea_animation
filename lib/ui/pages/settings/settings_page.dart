import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../bloc/settings/settings_cubit.dart';
import '../../../l10n/localization_helper.dart';
import '../../../routes/router.dart';
import '../../views/base_builders/app_consumer.dart';
import '../../../themes/theme_app.dart';
import '../../views/snack_bar/show_snack_bar.dart';
import 'components/language_card.dart';
import 'components/theme_card.dart';
import 'components/username_card.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppConsumer<SettingsCubit, SettingsState>(
      withoutScaffold: true,
      listenDefault: (context, state) {
        if (state is! SettingsStateUsernameSaved) return;
        AppSnackBar.of(context).showSuccess(context.strings.usernameSaved);
      },
      builder: (state) {
        return Scaffold(
          backgroundColor: context.colorScheme.background,
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              onPressed: context.router.pop,
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          body: _buildBody(context, state),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, SettingsState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          _buildTitle(context),
          const SizedBox(height: 28),
          _buildControls(context, state),
          const Spacer(),
          _buildDivider(context),
          const SizedBox(height: 8),
          _buildAboutAppButton(context, state),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.strings.settings,
          style: context.textTheme.subtitle1?.copyWith(fontSize: 24),
        ),
        const SizedBox(height: 8),
        DecoratedBox(
          decoration: BoxDecoration(
            color: context.colorScheme.secondaryContainer,
          ),
          child: const SizedBox(
            height: 1,
            width: 60,
          ),
        ),
      ],
    );
  }

  Widget _buildControls(BuildContext context, SettingsState state) {
    return Column(
      children: const [
        UsernameCard(),
        SizedBox(height: 8),
        LanguageCard(),
        SizedBox(height: 8),
        ThemeCard(),
        SizedBox(height: 8),
      ],
    );
  }

  Widget _buildAboutAppButton(BuildContext context, SettingsState state) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        context.router.push(
          AboutAppRoute(appVersion: state.settings.appVersion),
        );
      },
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.strings.aboutApp,
              style: context.textTheme.subtitle1?.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 2),
            _buildVersion(state),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: context.colorScheme.secondaryContainer,
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
