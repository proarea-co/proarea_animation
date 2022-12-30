import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../models/tab_item/tab_item.dart';
import '../../../../themes/extensions/app_menu_item_styles.dart';
import '../../../../themes/app_theme.dart';

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

  BoxDecoration _getDecoration(BuildContext context) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      gradient: _getGradient(context),
    );
  }

  BoxDecoration _getGradientDecoration(BuildContext context) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      color: _getColor(context),
    );
  }

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
      decoration: _getDecoration(context),
      padding: const EdgeInsets.all(2),
      child: GestureDetector(
        onTap: onTap,
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      decoration: _getGradientDecoration(context),
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
    );
  }
}
