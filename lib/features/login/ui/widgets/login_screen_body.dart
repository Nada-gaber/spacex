import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spacex/core/themes/text_styles.dart';
import 'package:spacex/features/login/ui/widgets/build_login_form.dart';
import 'package:spacex/features/login/ui/widgets/dont_have_account_text.dart';
import 'package:spacex/features/login/ui/widgets/login_bloc_consumer.dart';

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
              const LoginBlocConsumer(),
              const SizedBox(height: 15),
              const DontHaveAccountText(),
            ],
          ),
        ),
      ),
    );
  }
}
