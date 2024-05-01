import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/utils/app_regex.dart';
import 'package:spacex/core/widgets/custom_text_form_field.dart';
import 'package:spacex/features/register/logic/register/register_cubit.dart';

class BuildRegisterForm extends StatelessWidget {
  const BuildRegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: context.read<RegisterCubit>().nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Name must not be empty';
              }
              return null;
            },
            text: 'Your Name',
            icon: Icons.person_outline_outlined,
          ),
          const SizedBox(height: 25),
          CustomTextFormField(
            controller: context.read<RegisterCubit>().emailController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Email must not be empty';
              } else if (!AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            text: 'Email Address',
            icon: Icons.mail_outline_outlined,
          ),
          const SizedBox(height: 25),
          CustomTextFormField(
            controller: context.read<RegisterCubit>().passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Password must not be empty';
              } else if (!AppRegex.isPasswordValid(value)) {
                return 'The password is too week';
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
