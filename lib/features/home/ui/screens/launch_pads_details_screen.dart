import 'package:flutter/material.dart';
import 'package:spacex/core/constant/colors.dart';
import 'package:spacex/features/home/data/models/launch_pad_model.dart';

import '../../../../core/utils/database_helper.dart';
import '../../../../core/widgets/saved_floating_action_button.dart';
import '../../../saved_items/data/models/saved_item.dart';
import '../widgets/launch_pads_details_screen_body.dart';

class LaunchPadsDetailsScreen extends StatelessWidget {
  final LaunchPad launchPad;

  const LaunchPadsDetailsScreen({super.key, required this.launchPad});

  @override
  Widget build(BuildContext context) {
    DataBaseHelper db = DataBaseHelper();

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
      floatingActionButton: SavedFloatingActionButton(
        onPressed: () async {
          SavedItemModel savedItem = SavedItemModel(
              id: null,
              title: launchPad.fullName.toString(),
              imageUrl: launchPad.images!.large![0].toString(),
              country: launchPad.locality.toString(),
              type: "Launch Pad");
          await db.isSaved(launchPad.name.toString())
              ? await db.delete(launchPad.name.toString())
              : await db.saveItem(savedItem);
        },
        icon: Icons.star_border,
      ),
    );
  }
}
