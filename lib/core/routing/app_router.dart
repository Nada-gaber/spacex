import 'package:flutter/material.dart';
import 'package:spacex/core/routing/routes.dart';
<<<<<<<<< Temporary merge branch 1
import 'package:spacex/features/home/ui/views/splash/splash_screen.dart';
import 'package:spacex/features/onboarding/onboarding_view.dart';
=========
import 'package:spacex/features/onboarding/ui/onboarding_screen.dart';
>>>>>>>>> Temporary merge branch 2

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
         case Routes.companyInfo:
        return MaterialPageRoute(
          builder: (context) => const CompanyInfoScreen (),
        );
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        );
            case Routes.ships:
        return MaterialPageRoute(builder: (context) => const ShipsScreen());
    }
    return null;
  }
}
