import 'package:flutter/material.dart';
import 'package:spacex/core/routing/routes.dart';
import 'package:spacex/features/crew/ui/views/crew_screen.dart';
import 'package:spacex/features/edit_profile/ui/views/edit_profile_screen.dart';
import 'package:spacex/features/home/ui/views/home_screen.dart';
import 'package:spacex/features/home/ui/views/launch_pads_details_screen.dart';
import 'package:spacex/features/home/ui/views/rocket_details_screen.dart';
import 'package:spacex/features/login/ui/login_screen.dart';
import 'package:spacex/features/onboarding/ui/onboarding_screen.dart';
import 'package:spacex/features/register/ui/register_screen.dart';
import 'package:spacex/features/ships/ui/ships.dart';

import '../../features/company_info/ui/company_info.dart';
import '../../features/splash/splash_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );

      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      case Routes.rocketDetails:
        return MaterialPageRoute(
          builder: (context) => const RocketDetailsScreen(),
        );
      case Routes.launchPadDetails:
        return MaterialPageRoute(
          builder: (context) => const LaunchPadsDetailsScreen(),
        );
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.companyInfo:
        return MaterialPageRoute(
          builder: (context) => const CompanyInfoScreen(),
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
      case Routes.crewScreen:
        return MaterialPageRoute(
          builder: (context) => const CrewScreen(),
        );
      case Routes.editProfileScreen:
        return MaterialPageRoute(
          builder: (context) => const EditProfileScreen(),
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
