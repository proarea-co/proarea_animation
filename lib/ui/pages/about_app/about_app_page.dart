import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../../l10n/localization_helper.dart';
import '../../../themes/theme_app.dart';
import '../../views/buttons/app_back_button.dart';
import '../design/app_shader_mask.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(context.strings.aboutApp),
      // ),
      backgroundColor: context.colorScheme.background,
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
    return Stack(
      children: [
        Column(
          children: [
            Expanded(child: _buildLogo()),
            Expanded(child: _buildContent(true)),
          ],
        ),
        _buildHead(),
      ],
    );
  }

  Widget _buildLandscape() {
    return Stack(
      children: [
        Row(
          children: [
            Expanded(child: _buildLogo()),
            Expanded(child: _buildContent(false)),
          ],
        ),
        _buildHead(),
      ],
    );
  }

  Widget _buildHead() {
    return Positioned(
      top: 4,
      left: 4,
      child: Builder(builder: (context) {
        return Row(
          children: [
            const SizedBox(
              height: 64,
              child: AppBackButton(),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: context.colorScheme.background.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                context.strings.aboutApp,
                style: context.textTheme.headline3,
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildLogo() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final shortestSide = constraints.biggest.shortestSide;

        return ConstrainedBox(
          constraints: BoxConstraints.loose(Size.fromWidth(shortestSide)),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Assets.images.proareaAnimationsLogo.provider(),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildContent(bool portrait) {
    return Builder(builder: (context) {
      return Container(
        decoration: BoxDecoration(
          color: context.colorScheme.secondary,
          borderRadius: _borderRadius(portrait),
        ),
        child: AppShaderMask(
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            children: [
              const SizedBox(height: 16),
              _buildHeadText(context, context.strings.aboutAppHead),
              const SizedBox(height: 8),
              _buildText(context, context.strings.aboutAppDescription),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildHeadText(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: context.textTheme.bodyText2?.copyWith(fontSize: 24),
      ),
    );
  }

  Widget _buildText(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: context.textTheme.bodyText2?.copyWith(fontSize: 16),
      ),
    );
  }
}
