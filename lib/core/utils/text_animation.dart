import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class TextAnimationTyper extends StatelessWidget {
  final String textAnimated;
  final double fontSize;
  final int milliseconds;
  const TextAnimationTyper(
      {super.key,
      required this.textAnimated,
      required this.fontSize,
      required this.milliseconds,
    });

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        TyperAnimatedText(
          textAnimated,
          textStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
          speed: Duration(milliseconds: milliseconds),
        ),
      ],
      totalRepeatCount: 1,
      pause: const Duration(milliseconds: 1000),
      displayFullTextOnTap: true,
      stopPauseOnTap: true,
    );
  }
}
