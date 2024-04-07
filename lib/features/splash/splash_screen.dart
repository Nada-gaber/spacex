import 'package:flutter/material.dart';
import '../../core/constant/color/app_color.dart';
import 'splash_utils/splash_navigate.dart';
import 'splash_widgets/splash_built.dart';

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
      backgroundColor: AppColor.backgroundColor,
      body: buildBody(context),
    );
  }
}