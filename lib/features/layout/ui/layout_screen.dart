import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:spacex/core/constant/colors.dart';
import 'package:spacex/features/company_sections/ui/company_sections_screen.dart';
import 'package:spacex/features/home/ui/screens/home_screen.dart';
import 'package:spacex/features/layout/models/rive_model.dart';
import 'package:spacex/features/layout/ui/widgets/custom_animated_bar.dart';
import 'package:spacex/features/profile/ui/profile_screen.dart';
import 'package:spacex/features/saved_items/ui/saved_items_screen.dart';
import 'package:spacex/features/streams/ui/screens/stream_intro.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  List<RiveModel> bottomNavItems = [
    RiveModel(
      src: "assets/app_icon/animated-icons.riv",
      artboard: "LIKE/STAR",
      stateMachineName: "STAR_Interactivity",
    ),
    RiveModel(
      src: "assets/app_icon/animated-icons.riv",
      artboard: "TIMER",
      stateMachineName: "TIMER_Interactivity",
    ),
    RiveModel(
      src: "assets/app_icon/animated-icons.riv",
      artboard: "HOME",
      stateMachineName: "HOME_interactivity",
    ),
    RiveModel(
      src: "assets/app_icon/animated-icons.riv",
      artboard: "CHAT",
      stateMachineName: "CHAT_Interactivity",
    ),
    RiveModel(
      src: "assets/app_icon/animated-icons.riv",
      artboard: "USER",
      stateMachineName: "USER_Interactivity",
    ),
  ];

  List<SMIBool?> riveIconInputs = [];
  List<StateMachineController?> controllers = [];
  int selectedNavIndex = 2;

  List<Widget> screens = [
    const SavedItemsScreen(),
    const CompanySectionsScreen(),
    const HomeScreen(),
    const StreamingIntroScreen(),
    const ProfileScreen(),
  ];

  void animateTheIcon(int index) {
    riveIconInputs[index]!.change(true);
    Future.delayed(
      const Duration(seconds: 1),
      () {
        riveIconInputs[index]!.change(false);
      },
    );
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller?.dispose();
    }
    super.dispose();
  }

  void riveOnInIt(Artboard artboard, {required String stateMachineName}) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, stateMachineName);

    artboard.addController(controller!);
    controllers.add(controller);

    riveIconInputs.add(controller.findInput<bool>('active') as SMIBool);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDarkBlue,
      body: SafeArea(
        child: Stack(
          children: [
            screens[selectedNavIndex],
            Positioned(
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
                        setState(() {
                          selectedNavIndex = index;
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomAnimatedBar(
                              isActive: selectedNavIndex == index),
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
            ),
          ],
        ),
      ),
    );
  }
}
