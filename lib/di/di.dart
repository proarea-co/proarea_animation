import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
GetIt configureDependencies(Environment environment) {
  return $initGetIt(getIt, environment: environment.name);
}

extension EnvironmentExtension on Environment {
  static const mock = 'mock';
}
