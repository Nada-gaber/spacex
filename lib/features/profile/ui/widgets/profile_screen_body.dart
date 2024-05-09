import 'package:flutter/material.dart';
import 'package:spacex/core/routing/extensions.dart';
import 'package:spacex/core/routing/routes.dart';
import 'package:spacex/features/profile/ui/widgets/profile_component.dart';
import 'package:spacex/features/home/ui/widgets/logout_bloc_listener.dart';
import 'package:spacex/features/profile/ui/widgets/profile_section.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
      child: Column(
        children: [
          const ProfileSection(),
          ProfileComponent(
            title: "Edit Profile",
            icon: Icons.person_pin,
            onTap: () {
              context.pushNamed(Routes.editProfileScreen);
            },
          ),
          buildDivide(),
          const LogoutBlocListener(),
        ],
      ),
    );
  }
}
