import 'package:flutter/material.dart';
import 'package:spacex/core/routing/routes.dart';
import 'package:spacex/features/home/ui/views/splash/splash_screen.dart';
import 'package:spacex/features/onboarding/onboarding_view.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnboardingView(),
        );

      case Routes.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
    return null;
  }
}
