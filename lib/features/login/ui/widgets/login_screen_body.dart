import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/themes/text_styles.dart';
import 'package:spacex/core/widgets/auth_text_button.dart';
import 'package:spacex/features/login/logic/login_cubit/login_cubit.dart';
import 'package:spacex/features/login/ui/widgets/build_login_form.dart';
import 'package:spacex/features/login/ui/widgets/dont_have_account_text.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Welcome Back',
                style: MyTextStyles.font40WhiteBold,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.1,
              ),
              const BuildLoginForm(),
              const SizedBox(height: 15),
              const Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  'Forget Password ?',
                  style: MyTextStyles.font14WhiteBold,
                ),
              ),
              const SizedBox(height: 15),
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  return AuthTextButton(
                    text: 'Login',
                    requestLoading: context.read<LoginCubit>().requestLoading,
                    onPressed: () {
                      if (context
                          .read<LoginCubit>()
                          .formKey
                          .currentState!
                          .validate()) {
                        context.read<LoginCubit>().login();
                      }
                    },
                  );
                },
              ),
              const SizedBox(height: 15),
              const DontHaveAccountText(),
            ],
          ),
        ),
      ),
    );
  }
}
