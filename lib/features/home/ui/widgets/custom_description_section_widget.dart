import 'package:flutter/material.dart';

import '../../../../core/constant/colors.dart';

class CustomDescriptionSection extends StatefulWidget {
  final String descriptionText;

  const CustomDescriptionSection({super.key, required this.descriptionText});


  @override
  State<CustomDescriptionSection> createState() =>
      _CustomDescriptionSectionState();
}

class _CustomDescriptionSectionState extends State<CustomDescriptionSection> {
  bool _showFullText = false;

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
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
          widget.descriptionText,
          maxLines: _showFullText ? 100 : 5,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.grey,
              fontSize: widthScreen / 24,
              fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _showFullText = !_showFullText;
            });
          },
          child: Text(
            _showFullText ? 'Show Less' : 'Show More',
            style: const TextStyle(
              color: AppColors.blueGray,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
