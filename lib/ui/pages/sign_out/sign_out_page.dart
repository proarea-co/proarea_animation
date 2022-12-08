import 'package:flutter/material.dart';

import '../../../l10n/localization_helper.dart';
import '../../../themes/extensions/sign_out_animation_styles.dart';
import '../../../themes/theme_app.dart';
import 'components/animated_button.dart';

class SignOutPage extends StatefulWidget {
  const SignOutPage({super.key});

  @override
  State<SignOutPage> createState() => _SignOutPageState();
}

class _SignOutPageState extends State<SignOutPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 10000),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _playAnimation() {
    if (_controller.isAnimating) return;

    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorScheme.background,
        title: Text(
          context.strings.signOut,
          style: context.textTheme.subtitle1,
        ),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _playAnimation,
        child: AnimatedButton(
          controller: _controller.view,
          begin: context.extension<SignOutAnimationStyles>()?.begin ?? Colors.white,
          end: context.extension<SignOutAnimationStyles>()?.end ?? Colors.black,
        ),
      ),
    );
  }
}
