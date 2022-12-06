import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../../mock/funny_texts_mock.dart';

class AnimatedTextPage extends StatefulWidget {
  const AnimatedTextPage({super.key});

  @override
  _AnimatedTextPageState createState() => _AnimatedTextPageState();
}

class _AnimatedTextPageState extends State<AnimatedTextPage> {
  int _index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final animatedTextExample = FunnyTextsMock.animatedTextExamples()[_index];

    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(color: animatedTextExample.color),
          constraints: const BoxConstraints.expand(),
          child: Center(
            key: ValueKey(animatedTextExample.label),
            child: animatedTextExample.child,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              // _index = ++_index % _examples.length;
            });
          },
          tooltip: 'Next',
          backgroundColor: Colors.purple,
          child: const Icon(
            Icons.play_circle_filled,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}
