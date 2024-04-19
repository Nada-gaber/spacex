import 'package:flutter/material.dart';
import 'package:spacex/core/themes/text_styles.dart';
import 'package:spacex/core/widgets/custom_auth_loading.dart';

class AuthTextButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final bool requestLoading;

  const AuthTextButton({
    super.key,
    required this.text,
    this.onPressed,
    required this.requestLoading,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Colors.white,
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
              style: MyTextStyles.font20BlackBold,
            )
          : const CustomAuthLoading(),
    );
  }
}
