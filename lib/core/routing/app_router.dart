import 'package:flutter/material.dart';
import 'package:spacex/core/routing/routes.dart';
import 'package:spacex/features/onboarding/ui/onboarding_view.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnboardingView(),
        );
    }
    return null;
  }
}
