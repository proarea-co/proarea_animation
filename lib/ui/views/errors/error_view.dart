import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String massage;

  const ErrorView({
    super.key,
    required this.massage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.error,
      child: Center(child: Text(massage)),
    );
  }
}
