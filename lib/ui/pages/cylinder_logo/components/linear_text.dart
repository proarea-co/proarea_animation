import 'package:flutter/material.dart';

import '../../../../l10n/localization_helper.dart';
import '../../../../themes/theme_app.dart';

class LinearText extends StatelessWidget {
  const LinearText({super.key});

  BoxDecoration _getDecoration(BuildContext context) {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          context.colorScheme.surface.withOpacity(0),
          context.colorScheme.surface.withOpacity(0.9),
          context.colorScheme.surface.withOpacity(0),
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        stops: const [0.0, 0.2, 0.8],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: Container(
        foregroundDecoration: _getDecoration(context),
        child: Text(
          context.strings.proArea,
          style: context.textTheme.subtitle1?.copyWith(
            fontSize: 110,
          ),
        ),
      ),
    );
  }
}
