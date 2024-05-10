import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spacex/core/constant/colors.dart';
import 'package:spacex/core/routing/app_router.dart';
import 'package:spacex/core/utils/dependency_injection.dart';
import 'package:spacex/core/utils/shared_preferences.dart';
import 'package:spacex/firebase_options.dart';
import 'package:spacex/spacex_app.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: AppColors.backgroundDarkBlue, 
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: AppColors.backgroundDarkBlue, 
  ));
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await MySharedPreferences.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(SpacexApp(
    appRouter: AppRouter(),
  ));
}
