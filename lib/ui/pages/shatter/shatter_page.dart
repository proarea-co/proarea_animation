import 'package:flutter/material.dart';

import '../../../l10n/localization_helper.dart';
import '../../../themes/theme_app.dart';
import 'components/shatter_view.dart';

class ShatterPage extends StatelessWidget {
  const ShatterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ShatterView(
      child: Container(
        constraints: const BoxConstraints.expand(),
        color: context.colorScheme.onPrimary,
        child: Center(
          child: Text(
            '${context.strings.welcomeBack}!',
            style: context.textTheme.bodyText1?.copyWith(
                  fontSize: 28,
                  color: context.colorScheme.primary,
                ),
          ),
        ),
      ),
      widgetBuilder: (onPressed) => Container(
        constraints: const BoxConstraints.expand(),
        color: Colors.deepOrangeAccent,
        child: Center(
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(context.strings.shatter.toUpperCase()),
          ),
        ),
      ),
    );
  }
}
