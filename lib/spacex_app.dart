import 'package:flutter/material.dart';
import 'package:spacex/core/routing/app_router.dart';
import 'package:spacex/core/routing/routes.dart';

class SpacexApp extends StatelessWidget {
  final AppRouter appRouter;
  const SpacexApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.onboarding,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
