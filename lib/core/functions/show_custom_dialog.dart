import 'package:flutter/material.dart';
import 'package:spacex/core/constant/colors.dart';
import 'package:spacex/core/routing/extensions.dart';
import 'package:spacex/core/themes/text_styles.dart';
import 'package:spacex/core/widgets/custom_text_button.dart';

showCustomDialog(BuildContext context, void Function()? onPressed) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Warning', style: MyTextStyles.font20BlackBold),
            const SizedBox(height: 20),
            const Text('Your data will be not saved, are you sure', style: MyTextStyles.font16BlackBold),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomTextButton(
                    text: 'Cancel',
                    onPressed: () {
                      context.pop();
                    },
                    backgroundColor: AppColors.backgroundDarkBlue,
                    requestLoading: false,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomTextButton(
                    text: 'Continue',
                    onPressed: onPressed,
                    backgroundColor: AppColors.backgroundDarkBlue,
                    requestLoading: false,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}