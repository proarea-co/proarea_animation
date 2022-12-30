import 'package:flutter/material.dart';

import '../../../../themes/app_theme.dart';

class ArrowIconsView extends StatelessWidget {
  final ValueChanged<bool> switchUser;
  const ArrowIconsView({
    super.key,
    required this.switchUser,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      bottom: 0,
      right: 8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildUpButton(context),
          _buildDownButton(context),
        ],
      ),
    );
  }

  Widget _buildUpButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_upward),
      color: context.colorScheme.onPrimary,
      onPressed: () {
        switchUser(false);
      },
    );
  }

  Widget _buildDownButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.colorScheme.onPrimary,
      ),
      child: IconButton(
        color: context.colorScheme.onTertiary,
        icon: const Icon(Icons.arrow_downward),
        onPressed: () {
          switchUser(true);
        },
      ),
    );
  }
}
