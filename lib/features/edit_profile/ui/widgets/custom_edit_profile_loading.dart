import 'package:flutter/material.dart';
import 'package:spacex/core/widgets/custom_shimmer_loading.dart';

class CustomEditProfileLoading extends StatelessWidget {
  const CustomEditProfileLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmerLoading(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.2,
              width: MediaQuery.sizeOf(context).height * 0.2,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            Container(
              height: MediaQuery.sizeOf(context).height * 0.035,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: MediaQuery.sizeOf(context).height * 0.035,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
