import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/constant/strings.dart';
import 'package:spacex/core/functions/show_toast.dart';
import 'package:spacex/core/routing/extensions.dart';
import 'package:spacex/core/routing/routes.dart';
import 'package:spacex/core/utils/shared_preferences.dart';
import 'package:spacex/core/widgets/custom_text_button.dart';
import 'package:spacex/features/login/logic/login_cubit/login_cubit.dart';

class LoginBlocConsumer extends StatelessWidget {
  const LoginBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    bool requestLoading = false;
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          requestLoading = true;
        } else if (state is LoginSuccess) {
          MyStrings.token = state.token;
          MySharedPreferences.setString('token', state.token);
          print(state.token);
          showToast(text: 'Login done successfully');
          context.pushNamedAndRemoveUntil(
            Routes.home,
            predicate: (route) => false,
          );
          requestLoading = false;
        } else if (state is LoginFailure) {
          showToast(text: state.errorMessage);
          requestLoading = false;
        }
      },
      builder: (context, state) {
        return CustomTextButton(
          text: 'Login',
          requestLoading: requestLoading,
          onPressed: () {
            if (context.read<LoginCubit>().formKey.currentState!.validate()) {
              context.read<LoginCubit>().login();
            }
          },
        );
      },
    );
  }
}
