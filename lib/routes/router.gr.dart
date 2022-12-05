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
          routeData: routeData, child: const PostsPage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: 'Splash', fullMatch: true),
        RouteConfig(SplashRoute.name, path: 'Splash'),
        RouteConfig(HomeRoute.name, path: 'Home'),
        RouteConfig(PostsRoute.name, path: 'Posts')
      ];
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: 'Splash');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'Home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [PostsPage]
class PostsRoute extends PageRouteInfo<void> {
  const PostsRoute() : super(PostsRoute.name, path: 'Posts');

  static const String name = 'PostsRoute';
}
