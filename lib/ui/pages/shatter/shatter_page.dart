import 'package:flutter/material.dart';

import '../../../l10n/localization_helper.dart';
import 'components/shatter_view.dart';

class ShatterPage extends StatelessWidget {
  const ShatterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ShatterView(
      child: Container(
        constraints: const BoxConstraints.expand(),
        color: Colors.white,
        child: Center(
          child: Text(
            '${context.strings.welcomeBack}!',
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: Colors.black,
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
