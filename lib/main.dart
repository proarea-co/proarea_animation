import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'di/di.dart';
import 'root_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(const Environment(EnvironmentExtension.mock));

  runApp(RootApp(router: locator()));
}
