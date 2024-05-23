import 'package:flutter/material.dart';
import 'package:spacex/core/widgets/custom_app_bar.dart';
import 'package:spacex/features/profile/ui/widgets/profile_screen_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(
          title: 'Profile',
        ),
        Expanded(
          child: ProfileScreenBody(),
        ),
      ],
    );
  }
}
