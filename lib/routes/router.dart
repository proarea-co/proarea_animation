import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/pages/home/home_page.dart';
import '../ui/pages/splash/splash_page.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: 'Splash',
      page: SplashPage,
      initial: true,
    ),
    AutoRoute(
      path: 'Home',
      page: HomePage,
    ),
  ],
)
class AppRouter extends _$AppRouter {}