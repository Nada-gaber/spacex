import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:spacex/core/constant/images.dart';

class CustomMessageBoxWidget extends StatefulWidget {
  const CustomMessageBoxWidget({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  State<CustomMessageBoxWidget> createState() => _CustomMessageBoxWidgetState();
}

class _CustomMessageBoxWidgetState extends State<CustomMessageBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 8),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadiusDirectional.all(Radius.circular(16)),
            child: Image.asset(
              MyImages.animatedSpace,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsetsDirectional.symmetric(vertical: 8),
            padding: const EdgeInsetsDirectional.all(16),
            child: DefaultTextStyle(
              style: TextStyle(
                  wordSpacing: 3,
                  color: Colors.white,
                  fontSize: widget.screenWidth / 9,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'TR'),
              child: AnimatedTextKit(
                repeatForever: true,
                isRepeatingAnimation: true,
                animatedTexts: [
                  TypewriterAnimatedText(
                      'Explore the Universe with SpaceX 👩‍🚀☄'),
                  TypewriterAnimatedText(
                      'Explore the Universe with SpaceX 👩‍🚀☄'),
                  TypewriterAnimatedText(
                      'Explore the Universe with SpaceX 👩‍🚀☄'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
