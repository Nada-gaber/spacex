import 'package:flutter/material.dart';

class RowIsActive extends StatelessWidget {
  final bool isActive;
  const RowIsActive({
    super.key,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          isActive ? 'Active' : 'Not Active',
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: isActive ? Colors.green.shade400 : Colors.red.shade400),
        ),
        const SizedBox(
          height: 10,
        ),
        Icon(isActive ? Icons.done : Icons.close,
            color: isActive ? Colors.green.shade400 : Colors.red.shade400),
      ],
    );
  }
}
