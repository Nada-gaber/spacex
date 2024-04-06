import 'package:flutter/material.dart';

import '../../../../core/constant/colors.dart';

class CustomMessageBoxWidget extends StatelessWidget {
  const CustomMessageBoxWidget({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.symmetric(vertical: 12),
      padding: const EdgeInsetsDirectional.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(24),
          gradient: LinearGradient(colors: [
            AppColors.customBlueColor,
            Colors.white.withOpacity(.6),
            AppColors.customBlueColor,
            Colors.white.withOpacity(.6),
          ])),
      child: Text(
        "Explore the Universe with SpaceX 👩‍🚀☄",
        style:
            TextStyle(fontSize: screenWidth / 12, fontWeight: FontWeight.w600),
      ),
    );
  }
}
