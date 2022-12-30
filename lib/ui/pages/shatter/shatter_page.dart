import 'package:flutter/material.dart';

import '../../../l10n/localization_helper.dart';
import '../../../themes/app_theme.dart';
import 'components/shatter_view.dart';

class ShatterPage extends StatefulWidget {
  const ShatterPage({super.key});

  @override
  State<ShatterPage> createState() => _ShatterPageState();
}

class _ShatterPageState extends State<ShatterPage> {
  late int _count = 0;

  @override
  Widget build(BuildContext context) {
    return ShatterView(
      key: ValueKey(_count),
      child: _buildBack(context),
      widgetBuilder: (onPressed) => _buildFront(context, onPressed),
    );
  }

  Widget _buildBack(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      color: context.colorScheme.onPrimary,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${context.strings.welcomeBack}!',
              style: context.textTheme.bodyText1?.copyWith(
                fontSize: 28,
                color: context.colorScheme.primary,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _count++;
                });
              },
              child: Text(context.strings.cancel.toUpperCase()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFront(BuildContext context, VoidCallback onPressed) {
    return Container(
      constraints: const BoxConstraints.expand(),
      color: Colors.deepOrangeAccent,
      child: Center(
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(context.strings.shatter.toUpperCase()),
        ),
      ),
    );
  }
}
