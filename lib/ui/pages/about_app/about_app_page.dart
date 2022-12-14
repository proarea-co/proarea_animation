import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../bloc/app_controller/app_controller_cubit.dart';
import '../../../gen/assets.gen.dart';
import '../../../l10n/localization_helper.dart';
import '../../../themes/theme_app.dart';
import '../../views/base_builders/app_builder.dart';
import '../design/app_shader_mask.dart';

class AboutAppPage extends StatelessWidget {
  final String appVersion;

  const AboutAppPage({
    super.key,
    required this.appVersion,
  });

  BorderRadiusGeometry _borderRadius(bool portrait) {
    if (portrait) {
      return const BorderRadius.vertical(
        top: Radius.elliptical(32, 24),
      );
    }

    return const BorderRadius.horizontal(
      left: Radius.elliptical(24, 32),
    );
  }

  Color _getSheetColor(BuildContext context) {
    final theme = context.read<AppControllerCubit>().state.themeType;
    final light = theme == ThemeType.light;

    if (light) return context.colorScheme.onPrimary;

    return context.colorScheme.primary;
  }

  Color _getTextColor(BuildContext context) {
    final theme = context.read<AppControllerCubit>().state.themeType;
    final light = theme == ThemeType.light;

    if (light) return context.colorScheme.primary;

    return context.colorScheme.onPrimary;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: context.router.pop,
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: OrientationBuilder(builder: (context, orientation) {
          final portrait = orientation == Orientation.portrait;

          if (portrait) return _buildPortrait();

          return _buildLandscape();
        }),
      ),
    );
  }

  Widget _buildPortrait() {
    return Column(
      children: [
        const SizedBox(height: 16),
        _buildLogo(),
        const SizedBox(height: 28),
        Expanded(child: _buildContent(true)),
      ],
    );
  }

  Widget _buildLandscape() {
    return Row(
      children: [
        const SizedBox(width: 16),
        _buildLogo(),
        const SizedBox(width: 28),
        Expanded(child: _buildContent(false)),
      ],
    );
  }

  Widget _buildLogo() {
    return AppBuilder<AppControllerCubit, AppControllerState>(
      withoutScaffold: true,
      builder: (state) {
        final light = state.themeType == ThemeType.light;
        final asset = light ? Assets.svg.logoLight : Assets.svg.logoDark;
        return Center(child: SvgPicture.asset(asset));
      },
    );
  }

  Widget _buildContent(bool portrait) {
    return Builder(builder: (context) {
      return Container(
        decoration: BoxDecoration(
          color: _getSheetColor(context),
          borderRadius: _borderRadius(portrait),
        ),
        child: AppShaderMask(
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            children: [
              const SizedBox(height: 28),
              _buildAboutApp(context),
              const SizedBox(height: 8),
              _buildVersion(context),
              const SizedBox(height: 20),
              _buildSubHead(context),
              const SizedBox(height: 20),
              _buildText(context, context.strings.aboutAppDescription),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildAboutApp(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        context.strings.aboutAppFullName,
        textAlign: TextAlign.center,
        style: context.textTheme.bodyText1?.copyWith(
          color: _getTextColor(context),
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildVersion(BuildContext context) {
    return Text(
      context.strings.v(appVersion),
      textAlign: TextAlign.center,
      style: TextStyle(
        color: context.colorScheme.secondary,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildSubHead(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          SvgPicture.asset(Assets.svg.proAreaDark),
          const SizedBox(width: 20),
          Expanded(
            child: _buildHeadText(context, context.strings.aboutAppHead),
          ),
        ],
      ),
    );
  }

  Widget _buildHeadText(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: context.textTheme.bodyText1?.copyWith(
          color: _getTextColor(context),
          fontSize: 11,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildText(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: context.textTheme.bodyText1?.copyWith(
          color: _getTextColor(context),
          fontSize: 11,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
