import 'package:flutter/material.dart';
import '../../../core/constant/images.dart';

buildBody(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height,
    child: Image.asset(
      MyImages.animationSplash,
      fit: BoxFit.fitHeight,
    ),
  );
}
