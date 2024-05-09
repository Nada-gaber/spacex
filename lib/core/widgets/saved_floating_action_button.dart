import 'package:flutter/material.dart';

import '../constant/colors.dart';

class SavedFloatingActionButton extends StatelessWidget {
  final void Function()? onPressed;

  const SavedFloatingActionButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: AppColors.buttonBlue,
        child: const Icon(
          Icons.bookmark_add_outlined,
          size: 30,
        ),
      ),
    );
  }
}
