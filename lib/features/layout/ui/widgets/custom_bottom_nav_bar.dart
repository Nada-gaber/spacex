import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:spacex/features/layout/models/rive_model.dart';
import 'package:spacex/features/layout/ui/widgets/custom_animated_bar.dart';

class CustomBottomNavBar extends StatelessWidget {
  final List<RiveModel> bottomNavItems;
  final void Function(int index) animateTheIcon;
  final void Function(int index) changeCurrentIndex;
  final void Function(Artboard artboard, {required String stateMachineName})
      riveOnInIt;
  final int selectedNavIndex;

  const CustomBottomNavBar({
    super.key,
    required this.bottomNavItems,
    required this.selectedNavIndex,
    required this.changeCurrentIndex,
    required this.animateTheIcon,
    required this.riveOnInIt,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 24,
      left: 24,
      right: 24,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: Color(0xff1e2b3d),
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            bottomNavItems.length,
            (index) => GestureDetector(
              onTap: () {
                animateTheIcon(index);
                changeCurrentIndex(index);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomAnimatedBar(isActive: selectedNavIndex == index),
                  SizedBox(
                    height: 36,
                    width: 36,
                    child: Opacity(
                      opacity: selectedNavIndex == index ? 1 : 0.5,
                      child: RiveAnimation.asset(
                        bottomNavItems[index].src,
                        artboard: bottomNavItems[index].artboard,
                        onInit: (artboard) {
                          riveOnInIt(
                            artboard,
                            stateMachineName:
                                bottomNavItems[index].stateMachineName,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
