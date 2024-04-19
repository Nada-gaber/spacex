import 'package:flutter/material.dart';
import 'package:spacex/features/home/ui/widgets/display_details_row_widget.dart';

import 'drawer_component.dart';

class CustomDetailsSectionWidget extends StatelessWidget {
  const CustomDetailsSectionWidget({super.key});

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
        const DisplayDetailsRowWidget(nameOfKey: "Type", value: "rocket"),
        buildDivide(),
        const DisplayDetailsRowWidget(
            nameOfKey: "Cost per launch", value: "6700000 \$"),
        buildDivide(),
        const DisplayDetailsRowWidget(
            nameOfKey: "First flight", value: "2006-03-24"),
        buildDivide(),
        const DisplayDetailsRowWidget(nameOfKey: "Company", value: "SpaceX"),
        buildDivide(),
        const DisplayDetailsRowWidget(
            nameOfKey: "Country", value: "Republic of Marshall Islands"),
        buildDivide(),
        const DisplayDetailsRowWidget(nameOfKey: "Height (m)", value: "22.25"),
        buildDivide(),
        const DisplayDetailsRowWidget(nameOfKey: "Mass (kg)", value: "30146"),
      ],
    );
  }
}
