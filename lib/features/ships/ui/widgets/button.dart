import 'package:flutter/material.dart';

import '../../../../../../core/constant/color/app_color.dart';
import '../../../../../../core/themes/text_styles.dart';

detailButton(String shipName) {
  return MaterialButton(
    onPressed: () {},
    child: Container(
      height: 45,
      decoration: BoxDecoration(
        color: AppColor.buttonColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            shipName,
            style: MyTextStyles.font20WhiteBoldW500,
          ),
          const Icon(
            Icons.favorite_border,
            size: 30,
            color: Colors.redAccent,
          ),
        ],
      ),
    ),
  );
}
