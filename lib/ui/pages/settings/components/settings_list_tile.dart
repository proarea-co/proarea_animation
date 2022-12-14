import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../themes/theme_app.dart';

class SettingsListTile extends StatelessWidget {
  final String asset;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const SettingsListTile({
    super.key,
    required this.asset,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 2),
            SvgPicture.asset(
              asset,
              width: 24,
              height: 24,
              color: context.colorScheme.secondaryContainer,
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: context.textTheme.subtitle1?.copyWith(
                    fontSize: 16,
                    height: 5/4,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: context.textTheme.bodyText2?.copyWith(fontSize: 10),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
