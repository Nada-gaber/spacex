  import 'package:flutter/material.dart';
import 'package:spacex/core/widgets/custom_icon_button.dart';
import 'package:url_launcher/url_launcher.dart';

costomIconButton(String url, IconData icon) {
    return CustomIconButton(
      onTap: () async {
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      },
      icon: icon,
      color: Colors.white,
      size: 30,
      isFontAwesomeIcons: true,
      backgroundColor: Colors.transparent,
    );
  }
