import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:spacex/core/routing/extensions.dart';
import 'package:spacex/core/routing/routes.dart';
import 'package:spacex/core/themes/text_styles.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
           TextSpan(
            text: 'Don\'t have an account?',
            style: MyTextStyles.font14WhiteBold.copyWith(
                fontFamily: 'TR'
            ),
          ),
          TextSpan(
            text: ' Register now',
            style: MyTextStyles.font18WhiteBold.copyWith(
              fontFamily: 'TR'
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacementNamed(Routes.register);
              },
          ),
        ],
      ),
    );
  }
}
