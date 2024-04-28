import 'package:flutter/material.dart';
import 'package:spacex/core/constant/colors.dart';
import 'splash_utils/splash_navigate.dart';
import 'splash_widgets.dart/splash_build.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToOnboarding(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDarkBlue,
      body: buildBody(context),
    );
  }
}