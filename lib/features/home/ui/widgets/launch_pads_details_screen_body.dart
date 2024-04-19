import 'package:flutter/cupertino.dart';

import 'custom_description_section_widget.dart';
import 'display_details_row_widget.dart';
import 'drawer_component.dart';

class LaunchPadsDetailsScreenBody extends StatelessWidget {
  const LaunchPadsDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(16),
                child: Image.network(
                  "https://i.imgur.com/rbpkg01.png",
                  height: MediaQuery.of(context).size.height / 3,
                  fit: BoxFit.fill,
                )),
            const CustomDescriptionSection(
                descriptionText:
                    "The second ASDS barge, Of Course I Still Love You (OCISLY), had been under construction in a Louisiana shipyard since early 2015 using a different hull—Marmac 304—in order to service launches on the east coast. It was built as a replacement for the first Just Read the Instructions and entered operational service for Falcon 9 Flight 19 in late June 2015. As of June 2015, its home port was Jacksonville, Florida, but after December 2015, it was transferred 160 miles (260 km) further south, at Port Canaveral. While the dimensions of the ship are nearly identical to the first ASDS, several enhancements were made including a steel blast wall erected between the aft containers and the landing deck. The ship was in place for a first-stage landing test on the CRS-7 mission, which failed on launch on 28 June 2015. On 8 April 2016 the first stage, which launched the Dragon CRS-8 spacecraft, successfully landed for the first time ever on OCISLY, which is also the first ever drone ship landing. In February 2018, the Falcon Heavy Test Flight's central core exploded upon impact next to OCISLY that damaged two of the four thrusters on the drone ship. Two thrusters were removed from the Marmac 303 barge in order to repair OCISLY."),
            Padding(
              padding: const EdgeInsets.only(left: 4, top: 15, bottom: 20),
              child: Text(
                'Some details',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const DisplayDetailsRowWidget(
                nameOfKey: "Full name", value: "Of Course I Still Love You"),
            buildDivide(),
            const DisplayDetailsRowWidget(nameOfKey: "Type", value: "ASDS"),
            buildDivide(),
            const DisplayDetailsRowWidget(
                nameOfKey: "locality", value: "Port of Los Angeles"),
            buildDivide(),
            const DisplayDetailsRowWidget(
                nameOfKey: "region", value: "California"),
            buildDivide(),
            const DisplayDetailsRowWidget(
                nameOfKey: "landing_attempts (success)", value: "61 (54)"),
            buildDivide(),
            const DisplayDetailsRowWidget(
                nameOfKey: "status", value: "retired"),
            const SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}
