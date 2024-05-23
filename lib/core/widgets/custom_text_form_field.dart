import 'package:flutter/material.dart';
import 'package:spacex/core/themes/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String text;
  final Widget suffixIcon;
  final bool? obscureText;

  const CustomTextFormField({
    super.key,
    this.validator,
    this.controller,
    required this.text,
    required this.suffixIcon,
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
        suffixIcon: suffixIcon,
        errorMaxLines: 4,
      ),
      obscureText: obscureText ?? false,
    );
  }
}
