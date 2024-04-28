import 'package:flutter/material.dart';
import 'package:spacex/core/widgets/custom_shimmer_loading.dart';

class CustomHomeProfileImageLoading extends StatelessWidget {
  const CustomHomeProfileImageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmerLoading(
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.1,
        width: MediaQuery.sizeOf(context).height * 0.1,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
      ),
    );
  }
}
