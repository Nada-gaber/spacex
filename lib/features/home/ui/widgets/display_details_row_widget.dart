import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/themes/text_styles.dart';

class DisplayDetailsRowWidget extends StatelessWidget {
  final String nameOfKey;
  final String value;

  const DisplayDetailsRowWidget(
      {super.key, required this.nameOfKey, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsetsDirectional.symmetric(vertical: 8, horizontal: 4),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$nameOfKey :",
              style: MyTextStyles.font18WhiteBold,
            ),
            const SizedBox(width: 10,),
            Flexible(
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
}
