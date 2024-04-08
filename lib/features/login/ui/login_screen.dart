import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spacex/core/constant/image/app_images.dart';
import 'package:spacex/core/themes/text_styles.dart';
import 'package:spacex/features/login/ui/widgets/build_login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppImage.authBackground,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome Back',
                  style: MyTextStyles.font40WhiteBold,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.1,
                ),
                const BuildLoginForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
