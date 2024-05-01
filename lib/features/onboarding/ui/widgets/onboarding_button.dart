import 'package:flutter/material.dart';
import 'package:spacex/core/constant/strings.dart';
import 'package:spacex/core/routing/extensions.dart';
import 'package:spacex/core/utils/shared_preferences.dart';

import '../../../../core/routing/routes.dart';

class OnboardingButton extends StatelessWidget {
  final PageController pageController;
  const OnboardingButton({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      onPressed: () {
        if (pageController.page! < 2) {
          pageController.nextPage(
            duration: const Duration(
              milliseconds: 750,
            ),
            curve: Curves.ease,
          );
        } else {
          MyStrings.isFirstTimeToOpenApp = false;
          MySharedPreferences.setBool('isFirstTimeToOpenApp', false);
          context.pushNamed(Routes.register);
        }
      },
      child: const Icon(
        Icons.arrow_forward_ios_outlined,
        color: Colors.black,
      ),
    );
  }
}
