import 'package:flutter/material.dart';
import 'package:spacex/core/widgets/custom_icon_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/widgets/text_color_animation.dart';

costomIconButton(String url, IconData icon, String linkName) {
  return Column(
    children: [
      CustomIconButton(
        onTap: () async {
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        },
        icon: icon,
        color: Colors.white,
        size: 25,
        isFontAwesomeIcons: true,
        backgroundColor: Colors.transparent,
      ),
      TextColorAnimation(
        textAnimated: linkName,
        fontSize: 15,
        padding: 0.0,
        alignment: Alignment.center,
      ),
    ],
  );
}
