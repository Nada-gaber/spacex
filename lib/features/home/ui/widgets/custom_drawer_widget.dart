import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spacex/core/routing/extensions.dart';
import 'package:spacex/features/home/ui/widgets/profile_section.dart';

import '../../../../core/routing/routes.dart';
import 'drawer_component.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black.withOpacity(.95),
      child: SafeArea(
        child: Column(
          children: [
            const ProfileSection(),
            const DrawerComponent(
              title: "My Profile",
              icon: Icons.person_pin,
            ),
            buildDivide(),
             DrawerComponent(
              title: "Crew",
              icon: Icons.groups,
              onTap: (){
                context.pushNamed(Routes.crewScreen);
              },
            ),
            buildDivide(),
            const DrawerComponent(
              title: "Dragons",
              icon: Icons.rocket_launch_outlined,
            ),
            buildDivide(),
            const DrawerComponent(
              title: "Ships",
              icon: FontAwesomeIcons.ship,
            ),
            buildDivide(),
            const DrawerComponent(
              title: "Company Information",
              icon: Icons.info_outline_rounded,
            ),
          ],
        ),
      ),
    );
  }
}
