import 'package:flutter/material.dart';

class CustomFailureWidget extends StatelessWidget {
  final String textError;

  const CustomFailureWidget({super.key, required this.textError});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [const Icon(Icons.warning_amber), Text(textError)],
    );
  }
}
