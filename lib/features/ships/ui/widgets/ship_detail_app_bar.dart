import 'package:flutter/material.dart';
import 'package:spacex/core/constant/colors.dart';

import '../../../../core/themes/text_styles.dart';

shipDetailAppBar(String shipName) {
  return AppBar(
    backgroundColor: AppColors.blueGray,
    title: Text(
      shipName,
      style: MyTextStyles.font20WhiteBoldW500,
    ),
  );
}
