import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spacex/core/di/dependency_injection.dart';
import 'package:spacex/core/routing/app_router.dart';
import 'package:spacex/firebase_options.dart';
import 'package:spacex/spacex_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(SpacexApp(
    appRouter: AppRouter(),
  ));
}
