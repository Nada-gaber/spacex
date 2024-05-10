import 'package:flutter/widgets.dart';
import 'package:spacex/core/utils/text_animation.dart';
import 'package:spacex/features/company_info/ui/widgets/text_animation_company.dart';

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
