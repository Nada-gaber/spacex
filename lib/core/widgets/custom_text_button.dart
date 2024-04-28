import 'package:flutter/material.dart';
import 'package:spacex/core/themes/text_styles.dart';
import 'package:spacex/core/widgets/custom_auth_loading.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final bool requestLoading;
  final Color? backgroundColor;

  const CustomTextButton({
    super.key,
    required this.text,
    this.onPressed,
    required this.requestLoading,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          backgroundColor ?? Colors.white,
        ),
        minimumSize: MaterialStateProperty.all(
          const Size(
            double.infinity,
            55,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      child: requestLoading == false
          ? Text(
              text,
              style: backgroundColor == null
                  ? MyTextStyles.font20BlackBold
                  : MyTextStyles.font20WhiteW600,
            )
          : const CustomAuthLoading(),
    );
  }
}
