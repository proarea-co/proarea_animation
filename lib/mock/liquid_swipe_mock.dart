import 'package:flutter/material.dart';

import '../models/liquid_swipe/liquid_swipe_model.dart';

class LiquidSwipeMock {
  static const pages = [
    LiquidSwipeModel(
      Color(0xFFFDA512),
      ['Flutter', 'is your tool!'],
    ),
    LiquidSwipeModel(
      Color(0xFFF7661C),
      ['Never doubt', 'your decisions'],
    ),
    LiquidSwipeModel(
      Color(0xFFF44336),
      ['Code', 'is the solution!'],
    ),
    LiquidSwipeModel(
      Color(0xFFD80962),
      ['Strive', 'for meaning'],
    ),
    LiquidSwipeModel(
      Color(0xFF7301FC),
      ['Attitude', 'changes the World'],
    ),
  ];
}
