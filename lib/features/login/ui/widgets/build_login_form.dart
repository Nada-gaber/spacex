import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/utils/app_regex.dart';
import 'package:spacex/core/widgets/custom_text_form_field.dart';
import 'package:spacex/features/login/logic/login_cubit/login_cubit.dart';

class BuildLoginForm extends StatelessWidget {
  const BuildLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: context.read<LoginCubit>().emailController,
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
          CustomTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            validator: (value) {
              if (value == null || !AppRegex.hasMinLength(value)) {
                return 'The password is too short';
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
