import 'package:flutter/material.dart';
import 'package:spacex/core/constant/colors.dart';

import '../widgets/launch_pads_details_screen_body.dart';

class LaunchPadsDetailsScreen extends StatelessWidget {
  const LaunchPadsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDarkBlue,
        title: const Text(
          "OCISLY",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.info_outline,
                size: 28,
              ))
        ],
      ),
      backgroundColor: AppColors.backgroundDarkBlue,
      body: const LaunchPadsDetailsScreenBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.buttonBlue,
        onPressed: () {},
        child: const Icon(
          Icons.favorite_border,
          size: 35,
        ),
      ),
    );
  }
}
