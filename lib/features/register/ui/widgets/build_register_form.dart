import 'package:flutter/material.dart';
import 'package:spacex/core/utils/app_regex.dart';
import 'package:spacex/core/widgets/custom_text_form_field.dart';

class BuildRegisterForm extends StatelessWidget {
  const BuildRegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: GlobalKey(),
      child: Column(
        children: [
          CustomFormField(
            validator: (value) {
              if (value == null) {
                return 'Name must not be empty';
              }
              return null;
            },
            text: 'Your Name',
            icon: Icons.person_outline_outlined,
          ),
          const SizedBox(height: 25),
          CustomFormField(
            validator: (value) {
              if (value == null || !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            text: 'Email Address',
            icon: Icons.mail_outline_outlined,
          ),
          const SizedBox(height: 25),
          CustomFormField(
            validator: (value) {
              if (value == null || !AppRegex.hasMinLength(value)) {
                return 'The password is too short, please enter at least 8 character';
              }
              return null;
            },
            text: 'Password',
            obscureText: true,
            icon: Icons.lock_outline_rounded,
          ),
        ],
      ),
    );
  }
}
