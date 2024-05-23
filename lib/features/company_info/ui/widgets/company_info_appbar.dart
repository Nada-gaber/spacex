import 'package:flutter/material.dart';
import '../../../../core/widgets/text_style.dart';

companyInfoAppBar(BuildContext context,) {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        textStyle(
          'SpaceX',
          18,
        ),
      ],
    ),
  );
}