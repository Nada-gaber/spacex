import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/constant/colors.dart';
import 'package:spacex/features/home/ui/widgets/profile_image_bloc_builder.dart';
import '../widgets/custom_drawer_widget.dart';
import '../widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDarkBlue,
        title: const Text(
          "SpaceX",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // navigate to profile page
            },
            child: const ProfileImageBlocBuilder(),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: const HomeScreenBody(),
      backgroundColor: AppColors.backgroundDarkBlue,
    );
  }
}
