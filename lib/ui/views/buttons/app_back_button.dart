import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: context.router.pop,
      alignment: Alignment.centerLeft,
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
    );
  }
}
