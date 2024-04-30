import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constant/colors.dart';

class CustomLoadingListOfLaunchPads extends StatelessWidget {
  const CustomLoadingListOfLaunchPads({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (context, index) {
        return Shimmer(
          gradient: const LinearGradient(
            colors: [
              AppColors.blueGray,
              AppColors.buttonBlue,
              Color.fromARGB(255, 23, 42, 63),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(vertical: 6),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 5.8,
                  child: AspectRatio(
                    aspectRatio: 1 / 1.2,
                    child: ClipRRect(
                      borderRadius: BorderRadiusDirectional.circular(16),
                      child: Container(
                        color: Colors.grey[200],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 8, vertical: 8),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: AppColors.blueGray,
                            borderRadius: BorderRadiusDirectional.all(
                                Radius.circular(8))),
                        width: double.infinity,
                        height: 32,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 8, vertical: 8),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: AppColors.blueGray,
                            borderRadius: BorderRadiusDirectional.all(
                                Radius.circular(8))),
                        width: double.infinity,
                        height: 24,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
