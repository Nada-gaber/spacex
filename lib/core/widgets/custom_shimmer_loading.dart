import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spacex/core/constant/colors.dart';

class CustomShimmerLoading extends StatelessWidget {
  final Widget child;
  const CustomShimmerLoading({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.blueGray,
      highlightColor: Colors.blue.shade100,
      child: child,
    );
  }
}
