import 'package:flutter/material.dart';

class AppLoader extends StatelessWidget {
  final double size;
  final bool withBackground;

  const AppLoader({
    Key? key,
    this.size = 56,
    this.withBackground = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(size * 0.5),
      decoration: withBackground
          ? BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
            )
          : null,
      child: SizedBox(
        height: size,
        width: size,
        child: CircularProgressIndicator(
          strokeWidth: size * 0.1,
        ),
      ),
    );
  }
}
