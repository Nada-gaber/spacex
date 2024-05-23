import 'package:flutter/material.dart';

textStyle(
  String text,
  double fontSize, {
  Color color = Colors.white,
  FontWeight fontWeight = FontWeight.bold,
}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
  );
}
