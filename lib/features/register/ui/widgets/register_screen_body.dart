import 'package:flutter/material.dart';
import 'package:spacex/core/themes/text_styles.dart';
import 'package:spacex/core/widgets/custom_text_button.dart';
import 'package:spacex/features/register/ui/widgets/build_register_form.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});

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
                'Let\'s Start',
                style: MyTextStyles.font40WhiteBold,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.1,
              ),
              const BuildRegisterForm(),
              const SizedBox(height: 45),
              const CustomTextButton(
                text: 'Register',
              ),
              const SizedBox(height: 15),
              const Text(
                'Terms and Conditions',
                style: MyTextStyles.font14WhiteBold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
