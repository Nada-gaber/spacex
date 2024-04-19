import 'package:flutter/material.dart';
import 'package:spacex/core/routing/extensions.dart';

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
          // ToDo navigate to login

          context.pushNamed(Routes.home);
        }
      },
      child: const Icon(
        Icons.arrow_forward_ios_outlined,
        color: Colors.black,
      ),
    );
  }
}
