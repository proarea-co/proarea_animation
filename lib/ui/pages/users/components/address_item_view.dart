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
            child: _buildText(context),
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
        color: context.colorScheme.primaryContainer,
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.subtitle1?.copyWith(
        color: context.colorScheme.primaryContainer,
      ),
    );
  }
}
