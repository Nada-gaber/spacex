import 'package:flutter/material.dart';
import 'package:spacex/core/routing/extensions.dart';

import '../../../../core/constant/colors.dart';

companyInfoErrorAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: AppColors.backgroundDarkBlue,
    leading: IconButton(
      onPressed: () => context.pop(),
      icon: const Icon(
        Icons.arrow_back,
        size: 24,
        color: Colors.white,
      ),
    ),
    title: const Text(
      'SpaceX Info',
    ),
  );
}
