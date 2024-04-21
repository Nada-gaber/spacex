import 'package:flutter/material.dart';

import '../../../../core/themes/text_styles.dart';

shipDetailAppBar(String shipName) {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: Text(
      shipName,
      style: MyTextStyles.font20WhiteBoldW500,
    ),
  );
}
