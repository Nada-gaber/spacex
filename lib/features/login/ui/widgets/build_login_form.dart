import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/utils/app_regex.dart';
import 'package:spacex/core/widgets/custom_text_form_field.dart';
import 'package:spacex/features/login/logic/login_cubit/login_cubit.dart';

class BuildLoginForm extends StatefulWidget {
  const BuildLoginForm({super.key});

  @override
  State<BuildLoginForm> createState() => _BuildLoginFormState();
}

class _BuildLoginFormState extends State<BuildLoginForm> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: context.read<LoginCubit>().emailController,
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
            controller: context.read<LoginCubit>().passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Password must not be empty';
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
