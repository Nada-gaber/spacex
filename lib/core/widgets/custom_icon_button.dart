import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomIconButton extends StatelessWidget {
  final void Function()? onTap;
  final bool isFontAwesomeIcons;
  final IconData icon;
  final Color color;
  final Color backgroundColor;
  final double size;

  const CustomIconButton({
    super.key,
    this.onTap,
    required this.isFontAwesomeIcons,
    required this.size,
    required this.color,
    required this.icon,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsetsDirectional.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        child: isFontAwesomeIcons == true
            ? FaIcon(
                icon,
                size: size,
                color: color,
              )
            : Icon(
                icon,
                size: size,
                color: color,
              ),
      ),
    );
  }
}
