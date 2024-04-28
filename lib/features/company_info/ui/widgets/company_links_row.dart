import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_icon_company.dart';

companyLinkRow(String twitterLink, String websiteLink, String flickrLink) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      costomIconButton(
        twitterLink,
        FontAwesomeIcons.twitter,
      ),
      const SizedBox(width: 10),
      costomIconButton(
        websiteLink,
        FontAwesomeIcons.globe,
      ),
      const SizedBox(width: 10),
      costomIconButton(
        flickrLink,
        FontAwesomeIcons.flickr,
      ),
    ],
  );
}
