  import 'package:flutter/material.dart';

import '../../../core/constant/image/app_images.dart';

 buildBody( BuildContext context) {
   
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        AppImage.animationSplash,
        fit: BoxFit.fitHeight,
      ),
    );
  }