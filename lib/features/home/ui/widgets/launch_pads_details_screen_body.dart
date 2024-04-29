import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import '../../data/models/launch_pad_model.dart';
import 'custom_description_section_widget.dart';
import 'display_details_row_widget.dart';
import 'drawer_component.dart';

class LaunchPadsDetailsScreenBody extends StatelessWidget {
  final LaunchPad launchPad;

  const LaunchPadsDetailsScreenBody({super.key, required this.launchPad});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(16),
                child: Hero(
                  tag: launchPad.name.toString(),
                  child: CachedNetworkImage(
                    imageUrl: launchPad.images!.large![0],
                    height: MediaQuery.of(context).size.height / 3,
                    fit: BoxFit.fill,
                  ),
                )),
            CustomDescriptionSection(
                descriptionText: launchPad.details.toString()),
            Padding(
              padding: const EdgeInsets.only(left: 4, top: 15, bottom: 20),
              child: Text(
                'Some details',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
            DisplayDetailsRowWidget(
                nameOfKey: "Full name", value: launchPad.fullName.toString()),
            buildDivide(),
            DisplayDetailsRowWidget(
                nameOfKey: "Locality", value: launchPad.locality.toString()),
            buildDivide(),
            DisplayDetailsRowWidget(
                nameOfKey: "Region", value: launchPad.region.toString()),
            buildDivide(),
            DisplayDetailsRowWidget(
                nameOfKey: "Landing Attempts (Success)",
                value:
                    "${launchPad.launchAttempts.toString()}(${launchPad.launchSuccesses.toString()})"),
            buildDivide(),
            DisplayDetailsRowWidget(
                nameOfKey: "Status", value: launchPad.status.toString()),
            const SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}
