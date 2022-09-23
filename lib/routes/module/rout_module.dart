import 'package:injectable/injectable.dart';

import '../router.dart';

@module
abstract class RoutModule {
  @lazySingleton
  AppRouter router() => AppRouter();
}
