import 'package:flutter/material.dart';
import 'package:spacex/core/constant/colors.dart';

import '../../../../../../core/themes/text_styles.dart';

detailsValuesRow(dynamic key, dynamic value) {
  return Padding(
    padding: const EdgeInsets.only(right: 20.0, left: 20),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              key.toString(),
              style: MyTextStyles.font18WhiteBold,
            ),
            Text(
              value.toString(),
              style: MyTextStyles.font18White60W600,
            ),
          ],
        ),
        const SizedBox(
          height: 7,
        ),
        const Divider(
          color: AppColors.blueGray,
        ),
      ],
    ),
  );
}
