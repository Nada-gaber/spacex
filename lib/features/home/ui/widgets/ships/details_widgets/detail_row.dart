import 'package:flutter/material.dart';

import '../../../../../../core/constant/color/app_color.dart';
import '../../../../../../core/themes/text_styles.dart';

detailsValuesRow(String key, String value) {
  return Padding(
    padding: const EdgeInsets.only(right: 20.0, left: 20),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              key,
              style: MyTextStyles.font20WhiteBoldW500,
            ),
            Text(
              value,
              style: MyTextStyles.font18WhiteW600,
            ),
          ],
        ),
        const SizedBox(
          height: 7,
        ),
        const Divider(
          color: AppColor.blueGrey,
        ),
      ],
    ),
  );
}
