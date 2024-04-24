import 'package:flutter/material.dart';
import 'package:spacex/core/routing/app_router.dart';
import 'package:spacex/spacex_app.dart';

import 'core/di/dependency_injection.dart';

void main() {
  setupGetIt();
  runApp(SpacexApp(
    appRouter: AppRouter(),
  ));
}
