import 'package:flutter/material.dart';
import 'package:spacex/core/constant/colors.dart';
import 'package:spacex/features/home/data/models/rocket_model.dart';

import '../../../../core/widgets/open_url_in_browser_icon_button.dart';
import '../widgets/rocket_details_screen_body.dart';

class RocketDetailsScreen extends StatelessWidget {
  final Rocket rocket;

  const RocketDetailsScreen({super.key, required this.rocket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDarkBlue,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDarkBlue,
        title: Text(
          rocket.name.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          OpenUrlInBrowserIconButton(
            urlString: rocket.wikipedia.toString(),
          ),
        ],
      ),
      body: RocketDetailsScreenBody(
        rocket: rocket,
      ),
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
