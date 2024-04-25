import 'package:flutter/material.dart';
import 'package:spacex/core/widgets/custom_shimmer_loading.dart';

class ProfileSectionLoading extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;

  const ProfileSectionLoading({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return CustomShimmerLoading(
      child: Column(
        children: [
          Container(
            height: screenHeight / 9.5,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            height: 15,
            width: screenWidth * 0.2,
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            height: 15,
            width: screenWidth * 0.4,
          ),
        ],
      ),
    );
  }
}
