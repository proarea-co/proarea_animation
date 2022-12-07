import 'package:flutter/material.dart';

import '../../../../themes/theme_app.dart';

class AddressItemView extends StatelessWidget {
  final String text;

  const AddressItemView({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: <Widget>[
          const SizedBox(width: 26),
          _buildDot(context),
          const SizedBox(width: 26),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDot(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.colorScheme.onBackground,
      ),
    );
  }
}