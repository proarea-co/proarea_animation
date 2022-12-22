import 'package:flutter/material.dart';

import '../../../themes/theme_app.dart';

class AppShaderMask extends StatelessWidget {
  final Widget child;

  const AppShaderMask({
    super.key,
    required this.child,
  });

  LinearGradient _getGradient(BuildContext context) {
    return LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [context.colorScheme.primary, Colors.transparent],
        stops: const [0.2, 1]);
  }

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) => _getGradient(context).createShader(
        Rect.fromLTRB(0, 0, rect.width, 32),
      ),
      blendMode: BlendMode.dstIn,
      child: child,
    );
  }
}
