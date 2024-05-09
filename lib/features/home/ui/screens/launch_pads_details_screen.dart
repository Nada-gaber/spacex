import 'package:flutter/material.dart';
import 'package:spacex/core/constant/colors.dart';
import 'package:spacex/features/home/data/models/launch_pad_model.dart';

import '../../../../core/widgets/saved_floating_action_button.dart';
import '../widgets/launch_pads_details_screen_body.dart';

class LaunchPadsDetailsScreen extends StatelessWidget {
  final LaunchPad launchPad;

  const LaunchPadsDetailsScreen({super.key, required this.launchPad});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDarkBlue,
        title: Text(
          launchPad.name.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      backgroundColor: AppColors.backgroundDarkBlue,
      body: LaunchPadsDetailsScreenBody(
        launchPad: launchPad,
      ),
      floatingActionButton: const SavedFloatingActionButton(),
    );
  }
}


