import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spacex/core/routing/extensions.dart';
import 'package:spacex/features/home/logic/get_profile_data/get_profile_data_cubit.dart';
import 'package:spacex/features/home/ui/widgets/logout_bloc_listener.dart';
import 'package:spacex/features/home/ui/widgets/profile_section.dart';

import '../../../../core/routing/routes.dart';
import 'drawer_component.dart';

class CustomDrawer extends StatelessWidget {
  final GetProfileDataState getProfileDataState;
  const CustomDrawer({super.key, required this.getProfileDataState});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black.withOpacity(.95),
      child: SafeArea(
        child: Column(
          children: [
            ProfileSection(
              getProfileDataState: getProfileDataState,
            ),
            DrawerComponent(
              title: "Edit Profile",
              icon: Icons.person_pin,
              onTap: () {
                context.pushNamed(Routes.editProfileScreen);
              },
            ),
            buildDivide(),
            DrawerComponent(
              title: "Crew",
              icon: Icons.groups,
              onTap: () {
                context.pushNamed(Routes.crewScreen);
              },
            ),
            buildDivide(),
            DrawerComponent(
              title: "Ships",
              icon: FontAwesomeIcons.ship,
              onTap: () {
                context.pushNamed(Routes.ships);
              },
            ),
            buildDivide(),
            DrawerComponent(
              title: "About",
              icon: Icons.info_outline_rounded,
              onTap: () {
                context.pushNamed(Routes.companyInfo);
              },
            ),
            buildDivide(),
            const LogoutBlocListener(),
          ],
        ),
      ),
    );
  }
}
