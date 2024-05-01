import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/routing/app_router.dart';
import 'package:spacex/core/routing/routes.dart';
import 'package:spacex/core/utils/dependency_injection.dart';
import 'package:spacex/features/home/logic/get_profile_data/get_profile_data_cubit.dart';

class SpacexApp extends StatelessWidget {
  final AppRouter appRouter;

  const SpacexApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    // ToDo add getProfileCubit and homeRepo and firebaseFirestore to getIt after merge previous branches
    return BlocProvider(
      create: (context) => getIt.get<GetProfileDataCubit>(),
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
