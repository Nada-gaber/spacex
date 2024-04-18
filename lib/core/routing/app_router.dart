import 'package:flutter/material.dart';
import 'package:spacex/core/routing/routes.dart';
import 'package:spacex/features/home/ui/views/home_screen.dart';
import 'package:spacex/features/home/ui/views/launch_pads_details_screen.dart';
import 'package:spacex/features/home/ui/views/rocket_details_screen.dart';

import 'package:spacex/features/onboarding/ui/onboarding_screen.dart';
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
