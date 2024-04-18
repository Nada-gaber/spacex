import 'package:flutter/material.dart';

import '../../../../core/constant/colors.dart';

class CustomDescriptionSection extends StatelessWidget {
  const CustomDescriptionSection({super.key, required this.descriptionText});

  final String descriptionText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, top: 15, bottom: 20),
          child: Text(
            'description',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width / 14,
                fontWeight: FontWeight.w600),
          ),
        ),
        Text(
          descriptionText,
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width / 21,
              fontWeight: FontWeight.w300,
              color: AppColors.textColor.withOpacity(.8)),
        ),
      ],
    );
  }
}
