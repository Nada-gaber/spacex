import 'package:flutter/material.dart';
import 'package:spacex/core/routing/routes.dart';
import 'package:spacex/features/home/ui/views/ships/ships.dart';
import 'package:spacex/features/login/ui/widgets/login_provider.dart';
import 'package:spacex/features/register/ui/register_screen.dart';
import '../../features/onboarding/ui/onboarding_screen.dart';
import '../../features/splash/splash_screen.dart';
import '../../features/home/ui/views/company_info/company_info.dart';


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
          builder: (context) => const LoginProvider(),
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