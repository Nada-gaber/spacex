import 'package:flutter/material.dart';
import 'package:spacex/core/constant/colors.dart';

import '../widgets/edit_profile_screen_body.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: EditProfileScreenBody(),
      ),
    );
  }
}
