import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/routing/routes.dart';
import 'package:spacex/features/crew/ui/views/crew_screen.dart';
import 'package:spacex/features/edit_profile/data/profile_repo.dart';
import 'package:spacex/features/edit_profile/logic/edit_profile_data/edit_profile_data_cubit.dart';
import 'package:spacex/features/edit_profile/logic/upload_profile_image/upload_profile_image_cubit.dart';
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
      // ToDo add editProfileCubit and profileRepo and firebaseFirestore to getIt after merge previous branches
      case Routes.editProfileScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => EditProfileDataCubit(
                  ProfileRepo(
                    FirebaseFirestore.instance,
                    FirebaseStorage.instance,
                  ),
                ),
              ),
              BlocProvider(
                create: (context) => UploadProfileImageCubit(
                  ProfileRepo(
                    FirebaseFirestore.instance,
                    FirebaseStorage.instance,
                  ),
                ),
              ),
            ],
            child: const EditProfileScreen(),
          ),
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
