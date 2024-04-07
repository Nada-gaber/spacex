import 'package:flutter/material.dart';
import 'package:spacex/core/themes/text_styles.dart';
import 'package:spacex/features/onboarding/model/onboarding_model.dart';

class CustomPageView extends StatelessWidget {
  final List<OnboardingModel> onboardingItems;
  final PageController pageController;

  const CustomPageView({
    super.key,
    required this.onboardingItems,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    onboardingItems[index].image,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: MediaQuery.sizeOf(context).height * 0.2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    onboardingItems[index].title,
                    style: MyTextStyles.font40WhiteBold,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    onboardingItems[index].subTitle,
                    style: MyTextStyles.font18WhiteW600,
                  ),
                ],
              ),
            ),
          ],
        );
      },
      itemCount: onboardingItems.length,
    );
  }
}
