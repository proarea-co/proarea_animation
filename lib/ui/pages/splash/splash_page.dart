import 'package:flutter/material.dart';

import '../../views/loaders/app_loader.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: AppLoader()),
    );
  }
}
