import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../bloc/settings/settings_cubit.dart';
import '../../../l10n/localization_helper.dart';
import '../../../routes/router.dart';
import '../../../themes/theme_app.dart';
import '../../views/base_builders/app_consumer.dart';
import '../../views/buttons/app_back_button.dart';
import '../../views/snack_bar/show_snack_bar.dart';
import 'components/language_card.dart';
import 'components/theme_card.dart';
import 'components/username_card.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  void _listenToEvents(
    BuildContext context,
    SettingsState state,
  ) {
    final actionsMap = {SettingsStateUsernameSaved: _onUsernameSaved};

    actionsMap[state.runtimeType]?.call(context);
  }

  void _onUsernameSaved(BuildContext context) {
    AppSnackBar.of(context).showSuccess(context.strings.usernameSaved);
  }

  @override
  Widget build(BuildContext context) {
    return AppConsumer<SettingsCubit, SettingsState>(
      withScaffold: false,
      listenDefault: _listenToEvents,
      builder: (state) {
        return Scaffold(
          backgroundColor: context.colorScheme.background,
          body: _buildBody(context, state),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, SettingsState state) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBackButton(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.sp,
              ),
              child: _buildContent(context, state),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackButton() {
    return SizedBox(
      height: 48.sp,
      width: 48.sp,
      child: const Center(
        child: AppBackButton(),
      ),
    );
  }

  Widget _buildContent(BuildContext context, SettingsState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.sp),
        _buildTitle(context),
        SizedBox(height: 28.sp),
        UsernameCard(username: state.settings.userName),
        SizedBox(height: 24.sp),
        const LanguageCard(),
        SizedBox(height: 24.sp),
        const ThemeCard(),
        SizedBox(height: 24.sp),
        const Spacer(),
        _buildDivider(context),
        SizedBox(height: 12.sp),
        _buildAboutAppButton(context, state),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.strings.settings,
          style: context.textTheme.subtitle1?.copyWith(fontSize: 24.sp),
        ),
        SizedBox(height: 8.sp),
        DecoratedBox(
          decoration: BoxDecoration(
            color: context.colorScheme.secondaryContainer,
          ),
          child: SizedBox(
            height: 1.sp,
            width: 60.sp,
          ),
        ),
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
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 2.sp),
            _buildVersion(state),
            SizedBox(height: 20.sp),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Divider(
      height: 1.sp,
      thickness: 1.sp,
      color: context.colorScheme.secondaryContainer,
    );
  }

  Widget _buildVersion(SettingsState state) {
    return Builder(
      builder: (context) {
        return Text(
          'v${state.settings.appVersion}',
          textAlign: TextAlign.center,
          style: context.textTheme.bodyText2?.copyWith(
            fontSize: 10.sp,
          ),
        );
      },
    );
  }
}
