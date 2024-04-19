import 'package:flutter/material.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/themes/text_styles.dart';

class CustomEditTextField extends StatelessWidget {
  const CustomEditTextField(
      {super.key, required this.currentValue, required this.hintText});

  final String currentValue;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsetsDirectional.all(10),
      margin: const EdgeInsetsDirectional.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
          color: AppColors.blueGray.withOpacity(.2),
          borderRadius: const BorderRadiusDirectional.all(Radius.circular(16))),
      child: TextField(
        cursorColor: AppColors.textWhite,
        decoration: InputDecoration(
            hintText: currentValue,
            hintStyle: TextStyle(
                color: AppColors.textWhite, fontSize: screenWidth / 18),
            labelStyle: MyTextStyles.font18WhiteBold,
            labelText: hintText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: InputBorder.none,
            suffixIcon: const Icon(
              Icons.mode_edit_outlined,
              size: 35,
              color: AppColors.textWhite,
            )),
      ),
    );
  }
}
