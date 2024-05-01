import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spacex/core/constant/colors.dart';
import 'package:spacex/core/constant/strings.dart';
import 'package:spacex/core/routing/extensions.dart';
import 'package:spacex/core/routing/routes.dart';
import 'splash_widgets.dart/splash_build.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      context.pushReplacementNamed(
        MyStrings.token == ''
            ? MyStrings.isFirstTimeToOpenApp == true
                ? Routes.onboarding
                : Routes.login
            : Routes.home,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDarkBlue,
      body: buildBody(context),
    );
  }
}
