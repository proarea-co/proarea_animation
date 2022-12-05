import 'package:flutter/material.dart';

import '../../../../models/tab_item/tab_item.dart';
import '../../../../themes/extensions/extensions.dart';
import '../../../../themes/theme_app.dart';

class AppMenuItem extends StatelessWidget {
  final TabItem routeItem;
  final VoidCallback? onTap;
  final bool selected;

  const AppMenuItem({
    super.key,
    required this.routeItem,
    this.onTap,
    this.selected = false,
  });

  Color? _getColor(BuildContext context) {
    final extension = context.extension<AppMenuItemStyles>();
    final selectedColor = extension?.selectedColor;
    final unSelectedColor = extension?.unSelectedColor;

    return selected ? selectedColor : unSelectedColor;
  }

  LinearGradient? _getGradient(BuildContext context) {
    return selected ? context.extension<AppMenuItemStyles>()?.gradient : null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        gradient: _getGradient(context),
      ),
      padding: const EdgeInsets.all(2),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: _getColor(context),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(routeItem.icon),
              const SizedBox(width: 12),
              Text(
                routeItem.name,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
