import 'package:flutter/material.dart';
import '../../../../../../core/themes/text_styles.dart';

detailsValuesRow(dynamic key, dynamic value) {
  return Padding(
    padding: const EdgeInsets.only(right: 10.0, left: 10),
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
      ],
    ),
  );
}
