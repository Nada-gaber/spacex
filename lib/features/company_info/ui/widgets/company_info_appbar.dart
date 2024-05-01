import 'package:flutter/material.dart';
import 'package:spacex/core/widgets/custom_icon_button.dart';
import '../../../../core/widgets/text_style.dart';

companyInfoAppBar(BuildContext context,String summary) {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        textStyle(
          'SpaceX',
          18,
        ),
        CustomIconButton(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialog(context,summary),
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

_buildPopupDialog(BuildContext context, String summary) {
  return AlertDialog(
    title: const Text('SpaceX'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(summary),
      ],
    ),
  );
}
