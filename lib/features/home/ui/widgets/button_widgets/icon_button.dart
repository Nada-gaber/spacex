import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

iconButton(
  IconData icon, {
  Color color = Colors.white,
  double size = 25,
  void Function()? onPressed,
}) {
  return IconButton(
      icon: FaIcon(
        icon,
        size: size,
        color: color,
      ),
      onPressed: onPressed);
}
