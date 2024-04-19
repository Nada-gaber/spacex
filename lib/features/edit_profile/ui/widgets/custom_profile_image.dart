import 'package:flutter/material.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/widgets/custom_icon_button.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        CircleAvatar(
          radius: screenWidth / 4.3,
          backgroundColor: AppColors.textWhite,
          child: CircleAvatar(
            radius: screenWidth / 4.4,
            backgroundColor: AppColors.blueGray,
            child: CircleAvatar(
              radius: screenWidth / 4.6,
              backgroundImage: const NetworkImage(
                  "https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
            ),
          ),
        ),
        Positioned(
            bottom: 5,
            right: 0,
            child: CustomIconButton(
              onTap: () {},
              size: screenWidth / 10,
              icon: Icons.edit,
            ))
      ],
    );
  }
}
