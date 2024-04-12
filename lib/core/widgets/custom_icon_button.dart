import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key, this.onTap, required this.icon, required this.size});

  final void Function()? onTap;
  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsetsDirectional.all(4),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.white.withOpacity(.8)),
          child: Icon(
            icon,
            size: size,
            color: Colors.black,
          )),
    );
  }
}
