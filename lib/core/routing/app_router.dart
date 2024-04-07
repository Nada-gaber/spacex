import 'package:flutter/material.dart';
import 'package:spacex/core/routing/routes.dart';
import '../../features/onboarding/ui/onboarding_screen.dart';
import '../../features/splash/splash_screen.dart';


class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
         case Routes.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
    return null;
  }
}
