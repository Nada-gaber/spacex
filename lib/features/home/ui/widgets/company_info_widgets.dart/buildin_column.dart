 import 'package:flutter/widgets.dart';

import '../text_widget/text_style.dart';

buildInfoColumn(String value, String label) {
    return Expanded(
      child: Column(
        children: [
          textStyle(value, 27,fontWeight: FontWeight.w400),
          textStyle(label, 12),
        ],
      ),
    );
  }