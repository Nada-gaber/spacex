import 'package:flutter/material.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/widgets/custom_failure_widget.dart';

class ErrorImageWidget extends StatelessWidget {
  const ErrorImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.blueGray.withOpacity(.3)),
      child: const Center(
        child: CustomFailureWidget(
          textError: "No Internet Connection",
          textSize: 16,
        ),
      ),
    );
  }
}
