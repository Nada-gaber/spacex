import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spacex/core/routing/extensions.dart';
import 'package:spacex/core/routing/routes.dart';

void navigateToOnboarding(BuildContext context) {
  Timer(const Duration(seconds: 5), () {
    context.pushReplacementNamed(Routes.onboarding);
  });
}