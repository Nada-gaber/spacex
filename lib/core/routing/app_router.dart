import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/routing/routes.dart';
import 'package:spacex/core/utils/dependency_injection.dart';
import 'package:spacex/features/crew/ui/views/crew_screen.dart';
import 'package:spacex/features/edit_profile/logic/edit_profile_data/edit_profile_data_cubit.dart';
import 'package:spacex/features/edit_profile/logic/upload_profile_image/upload_profile_image_cubit.dart';
import 'package:spacex/features/edit_profile/ui/views/edit_profile_screen.dart';
import 'package:spacex/features/home/data/models/launch_pad_model.dart';
import 'package:spacex/features/home/logic/cubits/launch_pads_cubit/launch_pads_cubit.dart';
import 'package:spacex/features/home/logic/cubits/rocket_cubit/rocket_cubit.dart';
import 'package:spacex/features/login/logic/login_cubit/login_cubit.dart';
import 'package:spacex/features/login/ui/login_screen.dart';
import 'package:spacex/features/onboarding/ui/onboarding_screen.dart';
import 'package:spacex/features/register/logic/create_user/create_user_cubit.dart';
import 'package:spacex/features/register/logic/register/register_cubit.dart';
import 'package:spacex/features/register/ui/register_screen.dart';
import 'package:spacex/features/ships/ui/ships.dart';

import '../../features/company_info/ui/company_info_screen.dart';
import '../../features/home/data/models/rocket_model.dart';
import '../../features/home/ui/screens/home_screen.dart';
import '../../features/home/ui/screens/launch_pads_details_screen.dart';
import '../../features/home/ui/screens/rocket_details_screen.dart';
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
          builder: (context) => MultiBlocProvider(providers: [
            BlocProvider<RocketCubit>(
              create: (BuildContext context) => getIt<RocketCubit>(),
            ),
            BlocProvider<LaunchPadsCubit>(
              create: (BuildContext context) => getIt<LaunchPadsCubit>(),
            ),
          ], child: const HomeScreen()),
        );

      case Routes.rocketDetails:
        final arg = settings.arguments as Rocket;
        return MaterialPageRoute(
          builder: (context) => RocketDetailsScreen(
            rocket: arg,
          ),
        );
      case Routes.launchPadDetails:
        final arg = settings.arguments as LaunchPad;
        return MaterialPageRoute(
          builder: (context) => LaunchPadsDetailsScreen(
            launchPad: arg,
          ),
        );
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.companyInfo:
        return MaterialPageRoute(
          builder: (context) => const CompanyInfoScreen(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<RegisterCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<CreateUserCubit>(),
              ),
            ],
            child: const RegisterScreen(),
          ),
        );
      case Routes.ships:
        return MaterialPageRoute(builder: (context) => const ShipsScreen());
      case Routes.crewScreen:
        return MaterialPageRoute(
          builder: (context) => const CrewScreen(),
        );
      case Routes.editProfileScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt.get<EditProfileDataCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt.get<UploadProfileImageCubit>(),
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
