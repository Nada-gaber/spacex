import 'package:flutter/material.dart';
import 'package:spacex/core/routing/routes.dart';
import 'package:spacex/features/home/ui/views/company_info/company_info.dart';
import 'package:spacex/features/onboarding/ui/onboarding_screen.dart';

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
    }
    return null;
  }
}
