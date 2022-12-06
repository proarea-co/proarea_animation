import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/pages/home/home_page.dart';
import '../ui/pages/posts/posts_page.dart';
import '../ui/pages/splash/splash_page.dart';
import '../ui/pages/users/users_page.dart';

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
    AutoRoute(
      path: 'Posts',
      page: PostsPage,
    ),
    AutoRoute(
      path: 'users',
      page: UsersPage,
    ),
  ],
)
class AppRouter extends _$AppRouter {}
