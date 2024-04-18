import 'package:flutter/material.dart';

import '../../../../core/themes/text_styles.dart';
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
        displayDetailsRowWidget("Type", "rocket"),
        buildDivide(),
        displayDetailsRowWidget("Cost per launch", "6700000 \$"),
        buildDivide(),
        displayDetailsRowWidget("First flight", "2006-03-24"),
        buildDivide(),
        displayDetailsRowWidget("Company", "SpaceX"),
        buildDivide(),
        displayDetailsRowWidget("Country", "Republic of Marshall Islands"),
        buildDivide(),
        displayDetailsRowWidget("Height (m)", "22.25"),
        buildDivide(),
        displayDetailsRowWidget("Mass (kg)", "30146"),
      ],
    );
  }
}

Widget displayDetailsRowWidget(String key, String value) {
  return Padding(
    padding: const EdgeInsetsDirectional.symmetric(vertical: 8, horizontal: 4),
    child: SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$key :",
            style: MyTextStyles.font20WhiteW600,
          ),
          SizedBox(
            child: Text(
              value,
              style: MyTextStyles.font18WhiteW400,
            ),
          ),
        ],
      ),
    ),
  );
}
