import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../../l10n/localization_helper.dart';
import '../../../themes/theme_app.dart';
import '../design/app_shader_mask.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.strings.aboutApp),
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
        Expanded(child: _buildLogo()),
        Expanded(child: _buildContent()),
      ],
    );
  }

  Widget _buildLandscape() {
    return Row(
      children: [
        Expanded(child: _buildLogo()),
        Expanded(child: _buildContent()),
      ],
    );
  }

  Widget _buildLogo() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final shortestSide = constraints.biggest.shortestSide;
        const padding = 8.0;
        return ConstrainedBox(
          constraints: BoxConstraints.loose(Size.fromWidth(shortestSide)),
          child: Container(
            margin: const EdgeInsets.all(padding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(shortestSide / 2),
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

  Widget _buildContent() {
    return Builder(builder: (context) {
      return AppShaderMask(
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          children: [
            const SizedBox(height: 16),
            _buildText(context, context.strings.aboutAppHead),
            const SizedBox(height: 8),
            _buildText(context, context.strings.aboutAppDescription),
          ],
        ),
      );
    });
  }

  Widget _buildText(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: context.textTheme.bodyText2?.copyWith(fontSize: 16),
      ),
    );
  }
}
