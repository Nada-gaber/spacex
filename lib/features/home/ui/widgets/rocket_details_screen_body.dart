import 'package:flutter/cupertino.dart';

import '../../data/models/rocket_model.dart';
import 'custom_description_section_widget.dart';
import 'custom_details_section_widget.dart';
import 'displaying_images_widget.dart';

class RocketDetailsScreenBody extends StatelessWidget {
  final Rocket rocket;

  const RocketDetailsScreenBody({super.key, required this.rocket});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: DisplayingImagesWidget(
                images: rocket.flickrImages,
                lengthOfImagesList: rocket.flickrImages!.length,
              ),
            ),
            CustomDescriptionSection(
                descriptionText: rocket.description.toString()),
            CustomDetailsSectionWidget(
              rocket: rocket,
            ),
            const SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}
