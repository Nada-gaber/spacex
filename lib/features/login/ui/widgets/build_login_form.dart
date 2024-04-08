import 'package:flutter/material.dart';
import 'package:spacex/core/widgets/custom_text_form_field.dart';

class BuildLoginForm extends StatelessWidget {
  const BuildLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomFormField(
          text: 'Email Address',
          icon: Icons.mail_outline_outlined,
        ),
        SizedBox(height: 25),
        CustomFormField(
          text: 'Password',
          obscureText: true,
          icon: Icons.lock_outline_rounded,
        ),
      ],
    );
  }
}
