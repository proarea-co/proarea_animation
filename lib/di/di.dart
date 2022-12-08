import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final locator = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<GetIt> configureDependencies(Environment environment) async{
  return $initGetIt(locator, environment: environment.name);
}

extension EnvironmentExtension on Environment {
  static const mock = 'mock';
}
