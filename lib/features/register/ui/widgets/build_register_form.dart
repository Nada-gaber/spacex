import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/utils/app_regex.dart';
import 'package:spacex/core/widgets/custom_text_form_field.dart';
import 'package:spacex/features/register/logic/register/register_cubit.dart';

class BuildRegisterForm extends StatefulWidget {
  const BuildRegisterForm({super.key});

  @override
  State<BuildRegisterForm> createState() => _BuildRegisterFormState();
}

class _BuildRegisterFormState extends State<BuildRegisterForm> {
  bool isVisible = false;

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
            suffixIcon: const Icon(
              Icons.person_outline_outlined,
              color: Colors.white,
            ),
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
            suffixIcon: const Icon(
              Icons.mail_outline_outlined,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 25),
          CustomTextFormField(
            controller: context.read<RegisterCubit>().passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Password must not be empty';
              } else if (!AppRegex.isPasswordValid(value)) {
                return 'password must be at least 8 characters long and contain (1 lowercase letter, 1 uppercase letter, 1 special character, 1 number)';
              }
              return null;
            },
            text: 'Password',
            obscureText: isVisible ? false : true,
            suffixIcon: isVisible ? IconButton(
              onPressed: () {
                isVisible = false;
                setState(() {});
              },
              icon: const Icon(
                Icons.visibility,
                color: Colors.white,
              ),
            ) : IconButton(
              onPressed: () {
                isVisible = true;
                setState(() {});
              },
              icon: const Icon(
                Icons.visibility_off,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
