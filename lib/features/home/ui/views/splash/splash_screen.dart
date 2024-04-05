import 'package:flutter/material.dart';
import 'package:spacex/core/constant/color/app_color.dart';
import '../../utils/splash/splash.dart';
import '../../widgets/splash/splash_widgets.dart';

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
