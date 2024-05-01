import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spacex/core/constant/images.dart';

class CustomMessageBoxWidget extends StatelessWidget {
  const CustomMessageBoxWidget({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

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
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsetsDirectional.symmetric(vertical: 8),
            padding: const EdgeInsetsDirectional.all(16),
            child: Text(
              "Explore the Universe with SpaceX 👩‍🚀☄",
              style: TextStyle(
                  fontSize: screenWidth / 12, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
