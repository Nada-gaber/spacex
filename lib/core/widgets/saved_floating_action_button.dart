import 'package:flutter/material.dart';

import '../constant/colors.dart';

class SavedFloatingActionButton extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icon;

  const SavedFloatingActionButton(
      {super.key, this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Container(
        padding: const EdgeInsetsDirectional.all(2),
        decoration: BoxDecoration(
            color: AppColors.buttonBlue,
            borderRadius: BorderRadiusDirectional.circular(12)),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 30,
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
