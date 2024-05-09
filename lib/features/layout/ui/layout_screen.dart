import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:spacex/core/constant/colors.dart';
import 'package:spacex/features/home/ui/screens/home_screen.dart';
import 'package:spacex/features/layout/models/rive_model.dart';
import 'package:spacex/features/layout/ui/widgets/custom_bottom_nav_bar.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  List<RiveModel> bottomNavItems = [
    RiveModel(
      src: "assets/app_icon/animated-icons.riv",
      artboard: "HOME",
      stateMachineName: "HOME_interactivity",
    ),
    RiveModel(
      src: "assets/app_icon/animated-icons.riv",
      artboard: "TIMER",
      stateMachineName: "TIMER_Interactivity",
    ),
    RiveModel(
      src: "assets/app_icon/animated-icons.riv",
      artboard: "LIKE/STAR",
      stateMachineName: "STAR_Interactivity",
    ),
    RiveModel(
      src: "assets/app_icon/animated-icons.riv",
      artboard: "USER",
      stateMachineName: "USER_Interactivity",
    ),
  ];

  List<SMIBool?> riveIconInputs = [];
  List<StateMachineController?> controllers = [];
  int selectedNavIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    Container(),
    Container(),
    Container(),
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
            CustomBottomNavBar(
              selectedNavIndex: selectedNavIndex,
              bottomNavItems: bottomNavItems,
              changeCurrentIndex: (index) {
                setState(() {
                  selectedNavIndex = index;
                });
              },
              animateTheIcon: (index) => animateTheIcon,
              riveOnInIt: (artboard, {required stateMachineName}) =>
                  riveIconInputs,
            ),
          ],
        ),
      ),
    );
  }
}
