import 'package:flutter/material.dart';
import 'package:spacex/core/routing/extensions.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        context.pop();
      },
      child: Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(vertical: 12, horizontal: 8),
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_ios_outlined,
              size: screenWidth / 12,
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Edit",
                  style: TextStyle(fontSize: screenWidth / 22),
                ),
                Text(
                  "Profile",
                  style: TextStyle(fontSize: screenWidth / 15),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
