import 'package:flutter/material.dart';
import 'package:spacex/core/themes/text_styles.dart';

import '../../../../core/constant/colors.dart';

class DrawerComponent extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;

  const DrawerComponent({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          vertical: 12,
          horizontal: 12,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 32,
              color: AppColors.textWhite,
            ),
            const SizedBox(
              width: 14,
            ),
            Text(
              title,
              style: MyTextStyles.font18WhiteBold,
            )
          ],
        ),
      ),
    );
  }
}

Widget buildDivide() {
  return Padding(
    padding: const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 5),
    child: Divider(
      height: .5,
      color: Colors.grey.withOpacity(.2),
    ),
  );
}
