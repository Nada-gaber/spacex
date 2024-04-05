import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spacex/core/routing/routes.dart';

void navigateToOnboarding(BuildContext context) {
  Timer(const Duration(seconds: 5), () {
    Navigator.of(context).pushReplacementNamed(Routes.onboarding);
  });
}
