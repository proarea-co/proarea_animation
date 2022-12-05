import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'di/di.dart';

import 'bloc/app_controller/app_controller_cubit.dart';

import 'root.dart';

void main() {
  configureDependencies(const Environment(EnvironmentExtension.mock));

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppControllerCubit>(
      create: (_) => getIt()..init(),
      child: RootApp(router: getIt()),
    );
  }
}
