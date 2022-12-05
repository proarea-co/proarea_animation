import 'package:flutter/material.dart';

import '../../../../models/tab_item/tab_item.dart';

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

  LinearGradient _getGradient() {
    return const LinearGradient(
      colors: [
        Color(0xFF6A00FC),
        Color(0xFF6E02F5),
        Color(0xFF7B06E0),
        Color(0xFF8F0EBF),
        Color(0xFFAB1891),
        Color(0xFFCF2557),
        Color(0xFFEE3024),
        Color(0xFFFDC70C),
      ],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      stops: [0.05, 0.08, 0.1, 0.15, 0.2, 0.3, 0.55, 0.8],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        gradient: selected ? _getGradient() : null,
      ),
      padding: const EdgeInsets.all(2),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: selected ? const Color(0xFF373737) : const Color(0xFF212121),
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
