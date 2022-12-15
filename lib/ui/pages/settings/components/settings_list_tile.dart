import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

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
            SvgPicture.asset(
              asset,
              width: 24.sp,
              height: 24.sp,
              color: context.colorScheme.secondaryContainer,
            ),
            SizedBox(width: 12.sp),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: context.textTheme.subtitle1?.copyWith(
                    fontSize: 16.sp,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 2.sp),
                Text(
                  subtitle,
                  style: context.textTheme.bodyText2?.copyWith(
                    fontSize: 10.sp,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
