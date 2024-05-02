import 'package:flutter/material.dart';
import 'package:spacex/core/constant/colors.dart';

profileImageLoadingDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.white,
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.2,
        child: const Center(
          child: CircularProgressIndicator(
            color: AppColors.backgroundDarkBlue,
          ),
        ),
      ),
    ),
  );
}