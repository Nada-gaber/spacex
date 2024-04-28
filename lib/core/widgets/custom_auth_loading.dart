import 'package:flutter/material.dart';

class CustomAuthLoading extends StatelessWidget {
  const CustomAuthLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.black,
      ),
    );
  }
}