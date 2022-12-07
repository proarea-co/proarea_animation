import 'package:flutter/material.dart';

import '../../../themes/theme_app.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: context.colorScheme.secondary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: SizedBox(
        height: 32,
        child: Center(
          child: Text(
            text,
            style: context.textTheme.button?.copyWith(
              color: context.colorScheme.surface,
            ),
          ),
        ),
      ),
    );
  }
}
