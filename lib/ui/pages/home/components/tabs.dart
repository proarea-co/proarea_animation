import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../l10n/localization_helper.dart';
import '../../../../models/tab_item/tab_item.dart';
import '../../../../routes/router.dart';

class HomeTabs{
  static List<TabItem> get tabs {
    return [
      TabItem(
        (context) => context.strings.posts,
        Icons.article,
        const PostsRoute(),
      ),
      TabItem(
        (context) => context.strings.userList,
        Icons.account_circle,
        const UsersRoute(),
      ),
    ];
  }

  static List<PageRouteInfo<dynamic>> get routes {
    return tabs.map((tab) => tab.rout).toList();
  }
}