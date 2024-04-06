import 'package:flutter/material.dart';
import 'package:spacex/core/routing/routes.dart';
import 'package:spacex/features/home/ui/views/home_screen.dart';

import 'package:spacex/features/onboarding/ui/onboarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );


      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("No route"),
            ),
          ),
        );
      }

  }
}
