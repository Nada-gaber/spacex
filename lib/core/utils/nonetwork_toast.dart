import 'package:flutter/material.dart';

void showToastNoNetwork(BuildContext context, ) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("Check your Network Connection"),
    ),
  );
}