import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constant/colors.dart';

class CustomLoadingListOfRockets extends StatelessWidget {
  const CustomLoadingListOfRockets({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Shimmer(
            gradient: const LinearGradient(
              colors: [
                AppColors.blueGray,
                AppColors.buttonBlue,
                Color.fromARGB(255, 23, 42, 63),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(16),
                child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Container(
                      color: Colors.blue,
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 100,
                    )),
              ),
            ));
      },
      scrollDirection: Axis.horizontal,
      itemCount: 6,
    );
  }
}
