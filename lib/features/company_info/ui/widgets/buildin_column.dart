import 'package:flutter/widgets.dart';
import 'package:spacex/core/widgets/text_color_animation.dart';

import '../../../../core/widgets/text_animation.dart';


buildInfoColumn(String value, String label) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextAnimationTyper(
          textAnimated: value,
          fontSize: 27,
          milliseconds: 1000,
        ),
        TextColorAnimation(
          textAnimated: label,
          fontSize: 15,
          padding: 0.0, alignment: Alignment.center,
        )
      ],
    ),
  );
}