import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/pages/home/home_page.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: 'HomePage',
      page: HomePage,
      initial: true,
    ),
  ],
)
class AppRouter extends _$AppRouter {}
