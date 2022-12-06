import 'package:flutter/material.dart';

import '../../../../themes/theme_app.dart';

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
          IconButton(
            icon: const Icon(Icons.arrow_upward),
            onPressed: () {
              switchUser(false);
            },
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.colorScheme.onBackground,
            ),
            child: IconButton(
              color: context.colorScheme.primary,
              icon: const Icon(Icons.arrow_downward),
              onPressed: () {
                switchUser(true);
              },
            ),
          ),
        ],
      ),
    );
  }
}
