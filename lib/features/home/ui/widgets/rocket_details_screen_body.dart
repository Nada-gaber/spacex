import 'package:flutter/cupertino.dart';

import 'custom_description_section_widget.dart';
import 'custom_details_section_widget.dart';

class RocketDetailsScreenBody extends StatelessWidget {
  const RocketDetailsScreenBody({super.key});

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
                child: Image.network(
                  "https://imgur.com/azYafd8.jpg",
                  height: MediaQuery.of(context).size.height / 3,
                  fit: BoxFit.fill,
                )),
            const CustomDescriptionSection(
              descriptionText:
                  "The Falcon 1 was an expendable launch system privately developed and manufactured by SpaceX during 2006-2009. On 28 September 2008, Falcon 1 became the first privately-developed liquid-fuel launch vehicle to go into orbit around the Earth.",
            ),
            const CustomDetailsSectionWidget(),
            const SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}
