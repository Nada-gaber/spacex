import 'package:flutter/material.dart';

class CustomLoadingWidget extends StatelessWidget {
  final Color color;

  const CustomLoadingWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: color,
    ));
  }
}
