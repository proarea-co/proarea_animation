import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sizer/sizer.dart';
import 'di/di.dart';

import 'bloc/app_controller/app_controller_cubit.dart';

import 'root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(const Environment(EnvironmentExtension.mock));

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (_, __, ___) {
        return BlocProvider<AppControllerCubit>(
          create: (_) => locator()..init(),
          child: RootApp(router: locator()),
        );
      },
    );
  }
}
