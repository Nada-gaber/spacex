import 'package:flutter/material.dart';
import 'package:spacex/core/constant/images.dart';

class CustomLoadingWidget extends StatelessWidget {
  final Color color;

  const CustomLoadingWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            height: 100, width: 100, child: Image.asset(MyImages.loading)));
  }
}
