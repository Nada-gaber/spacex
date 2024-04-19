import 'package:flutter/material.dart';
import 'package:spacex/core/constant/colors.dart';

import '../widgets/rocket_details_screen_body.dart';

class RocketDetailsScreen extends StatelessWidget {
  const RocketDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundDarkBlue,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundDarkBlue,
          title: Text(
            "Falcon 1",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width / 15,
                fontWeight: FontWeight.w600),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.info_outline,
                  size: 35,
                ))
          ],
        ),
        body: const RocketDetailsScreenBody(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.buttonBlue,
          onPressed: () {},
          child: const Icon(
            Icons.favorite_border,
            size: 35,
          ),
        ),
      ),
    );
  }
}
