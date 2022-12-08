import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../models/tab_item/tab_item.dart';
import '../../../../themes/extensions/app_menu_item_styles.dart';
import '../../../../themes/theme_app.dart';

class AppMenuItem extends StatelessWidget {
  final TabItem routeItem;
  final AutoSizeGroup? group;
  final VoidCallback? onTap;
  final bool selected;

  const AppMenuItem({
    super.key,
    required this.routeItem,
    required this.group,
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
              Expanded(
                child: AutoSizeText(
                  routeItem.name(context),
                  group: group,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
