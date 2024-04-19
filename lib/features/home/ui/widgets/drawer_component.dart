import 'package:flutter/material.dart';

import '../../../../core/constant/colors.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent(
      {super.key, required this.title, required this.icon, this.onTap});

  final String title;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(vertical: 12, horizontal: 12),
        child: Row(
          children: [
            Icon(
              icon,
              size: screenWidth / 10,
              color: AppColors.textWhite,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: screenWidth / 18),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildDivide() {
  return Padding(
    padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
    child: Divider(
      height: .5,
      color: Colors.grey.withOpacity(.2),
    ),
  );
}
