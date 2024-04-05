import 'package:flutter/material.dart';
import 'package:spacex/core/constant/images.dart';
import 'package:spacex/features/onboarding/model/onboarding_model.dart';
import 'package:spacex/features/onboarding/ui/widgets/onboarding_button.dart';
import 'package:spacex/features/onboarding/ui/widgets/onboarding_page_view.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  List<OnboardingModel> onboardingItems = [
    OnboardingModel(
      image: MyImages.firstOnboarding,
      title: 'Galaxy Explorer',
      subTitle:
          'We will learn all of the scientific  disciplines that involve.',
    ),
    OnboardingModel(
      image: MyImages.secondOnboarding,
      title: 'Insights',
      subTitle:
          'Embark on an interstellar voyage like never before. Explore distant galaxies, uncover cosmic secrets, and witness the majesty of the universe. Your cosmic adventure begins here.',
    ),
    OnboardingModel(
      image: MyImages.thirdOnboarding,
      title: 'Let’s float in Universe',
      subTitle: 'Unlock a universe of knowledge and adventure with your pass.',
    ),
  ];

  PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPageView(
        pageController: pageController,
        onboardingItems: onboardingItems,
      ),
      floatingActionButton: OnboardingButton(pageController: pageController),
    );
  }
}
