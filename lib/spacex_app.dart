import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/routing/app_router.dart';
import 'package:spacex/core/routing/routes.dart';
import 'package:spacex/features/home/data/repo/home_repo.dart';
import 'package:spacex/features/home/logic/get_profile_data_cubit.dart';

class SpacexApp extends StatelessWidget {
  final AppRouter appRouter;

  const SpacexApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    // ToDo add getProfileCubit and homeRepo and firebaseFirestore to getIt after merge previous branches
    return BlocProvider(
      create: (context) =>
          GetProfileDataCubit(HomeRepo(FirebaseFirestore.instance))
            ..getProfileData(),
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.home,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
