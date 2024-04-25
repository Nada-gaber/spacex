import 'package:flutter/material.dart';
import 'package:spacex/features/home/ui/widgets/display_details_row_widget.dart';

import '../../data/models/rocket_model.dart';
import 'drawer_component.dart';

class CustomDetailsSectionWidget extends StatelessWidget {
  final Rocket rocket;
  const CustomDetailsSectionWidget({super.key, required this.rocket});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, top: 15, bottom: 20),
          child: Text(
            'Some details',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width / 14,
                fontWeight: FontWeight.w600),
          ),
        ),
         DisplayDetailsRowWidget(nameOfKey: "Type", value: rocket.type.toString()),
        buildDivide(),
         DisplayDetailsRowWidget(
            nameOfKey: "Cost per launch", value: "${rocket.costPerLaunch.toString()} \$"),
        buildDivide(),
         DisplayDetailsRowWidget(
            nameOfKey: "First flight", value: rocket.firstFlight.toString()),
        buildDivide(),
         DisplayDetailsRowWidget(nameOfKey: "Company", value: rocket.company.toString()),
        buildDivide(),
         DisplayDetailsRowWidget(
            nameOfKey: "Country", value: rocket.country.toString()),
        buildDivide(),
         DisplayDetailsRowWidget(nameOfKey: "Height (m)", value: rocket.height!.meters.toString()),
        buildDivide(),
         DisplayDetailsRowWidget(nameOfKey: "Mass (kg)", value: rocket.mass!.kg.toString()),
      ],
    );
  }
}
