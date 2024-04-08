import 'package:flutter/material.dart';
import 'package:spacex/core/routing/routes.dart';
import '../../features/home/ui/views/company_info/company_info.dart';
import '../../features/home/ui/views/splash/splash_screen.dart';
import '../../features/onboarding/ui/onboarding_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
         case Routes.companyInfo:
        return MaterialPageRoute(
          builder: (context) => const CompanyInfo(),
        );

      case Routes.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
    return null;
  }
}
