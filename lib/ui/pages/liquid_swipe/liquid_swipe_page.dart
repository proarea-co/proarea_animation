import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import '../../../mock/liquid_swipe_mock.dart';
import '../../../models/liquid_swipe/liquid_swipe_model.dart';
import '../../../themes/theme_app.dart';

class LiquidSwipePage extends StatelessWidget {
  const LiquidSwipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          LiquidSwipe(
            pages: LiquidSwipeMock.pages.map(_buildPage).toList(),
            positionSlideIcon: 0.8,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            waveType: WaveType.liquidReveal,
            ignoreUserGestureWhileAnimating: true,
          ),
        ],
      ),
    );
  }

  Widget _buildPage(LiquidSwipeModel page) {
    return Container(
      color: page.color,
      constraints: const BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: page.words.map((word) {
          return Builder(builder: (context) {
            return Text(word, style: context.textTheme.headlineLarge);
          });
        }).toList(),
      ),
    );
  }
}
