import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spacex/core/widgets/custom_icon_button.dart';

import '../../../../core/widgets/text_style.dart';

companyInfoAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        textStyle(
          'SpaceX',
          20,
        ),
        CustomIconButton(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialog(context),
            );
          },
          color: Colors.white,
          icon: Icons.info_outline_rounded,
          size: 24,
          isFontAwesomeIcons: false,
          backgroundColor: Colors.transparent,
        ),
      ],
    ),
  );
}

_buildPopupDialog(BuildContext context) {
  return const AlertDialog(
    title: Text('SpaceX'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
            "SpaceX designs, manufactures and launches advanced rockets and spacecraft. The company was founded in 2002 to revolutionize space technology, with the ultimate goal of enabling people to live on other planets."),
      ],
    ),
  );
}
