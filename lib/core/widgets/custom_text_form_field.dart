import 'package:flutter/material.dart';
import 'package:spacex/core/themes/text_styles.dart';

class CustomFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String text;
  final IconData icon;
  final bool? obscureText;

  const CustomFormField({
    super.key,
    this.validator,
    this.controller,
    required this.text,
    required this.icon,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      style: MyTextStyles.font14WhiteBold,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: MyTextStyles.font14WhiteBold,
        suffixIcon: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      obscureText: obscureText ?? false,
    );
  }
}