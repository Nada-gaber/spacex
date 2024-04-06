import 'package:flutter/material.dart';

import '../../../../core/constant/colors.dart';

class LaunchPadItem extends StatelessWidget {
  const LaunchPadItem({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 6),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight / 5.8,
              child: AspectRatio(
                aspectRatio: 1 / 1.2,
                child: ClipRRect(
                  borderRadius: BorderRadiusDirectional.circular(16),
                  child: Image.network(
                    "https://i.imgur.com/GGPgsVs.png",
                    fit: BoxFit.fill,
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
                  //full name
                  Padding(
                    padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: 8, vertical: 8),
                    child: Text(
                      "Vandenberg Space Force Base Space Launch Complex 3W",
                      style: TextStyle(
                          fontSize: screenWidth / 20,
                          fontWeight: FontWeight.w500),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  //region(location)
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: screenWidth / 15,
                        color: Colors.red,
                      ),
                      Text(
                        "Marshall Islands",
                        style: TextStyle(
                            color: AppColors.customBlueColor,
                            fontSize: screenWidth / 24,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
