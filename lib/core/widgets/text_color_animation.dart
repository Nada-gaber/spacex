import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class TextColorAnimation extends StatelessWidget {
  final String textAnimated;
  final double fontSize;
  final double padding;
  final Alignment alignment;
  const TextColorAnimation(
      {super.key,
      required this.textAnimated,
      required this.fontSize,
      required this.padding,
      required this.alignment});

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.purple,
      Colors.blue,
      Color(0xFF3B69FF),
      Color(0xFFC899FF),
    ];

    return Align(
      alignment: alignment,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText(
              textAnimated,
              textStyle: TextStyle(fontSize: fontSize),
              colors: colorizeColors,
            ),
          ],
          isRepeatingAnimation: true,
        ),
      ),
    );
  }
}