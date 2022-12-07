// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: WrappedRoute(child: const SplashPage()));
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: WrappedRoute(child: const HomePage()));
    },
    PostsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: WrappedRoute(child: const PostsPage()));
    },
    UsersRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: WrappedRoute(child: const UsersPage()));
    },
    LiquidSwipeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LiquidSwipePage());
    },
    ShatterRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ShatterPage());
    },
    AnimatedTextRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: WrappedRoute(child: const AnimatedTextPage()));
    },
    CylinderLogoRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const CylinderLogoPage());
    },
    SettingsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: WrappedRoute(child: const SettingsPage()));
    },
    SignOutRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: WrappedRoute(child: const SignOutPage()));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: 'splash', fullMatch: true),
        RouteConfig(SplashRoute.name, path: 'splash'),
        RouteConfig(HomeRoute.name, path: 'home', children: [
          RouteConfig('#redirect',
              path: '',
              parent: HomeRoute.name,
              redirectTo: 'posts',
              fullMatch: true),
          RouteConfig(PostsRoute.name, path: 'posts', parent: HomeRoute.name),
          RouteConfig(UsersRoute.name, path: 'users', parent: HomeRoute.name),
          RouteConfig(LiquidSwipeRoute.name,
              path: 'liquidSwipe', parent: HomeRoute.name),
          RouteConfig(ShatterRoute.name,
              path: 'shatter', parent: HomeRoute.name),
          RouteConfig(AnimatedTextRoute.name,
              path: 'animatedText', parent: HomeRoute.name),
          RouteConfig(CylinderLogoRoute.name,
              path: 'cylinderLogo', parent: HomeRoute.name),
          RouteConfig(SettingsRoute.name,
              path: 'settings', parent: HomeRoute.name),
          RouteConfig(SignOutRoute.name,
              path: 'signOut', parent: HomeRoute.name)
        ])
      ];
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: 'splash');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(HomeRoute.name, path: 'home', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [PostsPage]
class PostsRoute extends PageRouteInfo<void> {
  const PostsRoute() : super(PostsRoute.name, path: 'posts');

  static const String name = 'PostsRoute';
}

/// generated route for
/// [UsersPage]
class UsersRoute extends PageRouteInfo<void> {
  const UsersRoute() : super(UsersRoute.name, path: 'users');

  static const String name = 'UsersRoute';
}

/// generated route for
/// [LiquidSwipePage]
class LiquidSwipeRoute extends PageRouteInfo<void> {
  const LiquidSwipeRoute() : super(LiquidSwipeRoute.name, path: 'liquidSwipe');

  static const String name = 'LiquidSwipeRoute';
}

/// generated route for
/// [ShatterPage]
class ShatterRoute extends PageRouteInfo<void> {
  const ShatterRoute() : super(ShatterRoute.name, path: 'shatter');

  static const String name = 'ShatterRoute';
}

/// generated route for
/// [AnimatedTextPage]
class AnimatedTextRoute extends PageRouteInfo<void> {
  const AnimatedTextRoute()
      : super(AnimatedTextRoute.name, path: 'animatedText');

  static const String name = 'AnimatedTextRoute';
}

/// generated route for
/// [CylinderLogoPage]
class CylinderLogoRoute extends PageRouteInfo<void> {
  const CylinderLogoRoute()
      : super(CylinderLogoRoute.name, path: 'cylinderLogo');

  static const String name = 'CylinderLogoRoute';
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [SignOutPage]
class SignOutRoute extends PageRouteInfo<void> {
  const SignOutRoute() : super(SignOutRoute.name, path: 'signOut');

  static const String name = 'SignOutRoute';
}
