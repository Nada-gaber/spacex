import 'package:flutter/material.dart';
import 'package:spacex/core/widgets/custom_text_button.dart';

import 'custom_app_bar.dart';
import 'custom_edit_text_field.dart';
import 'custom_profile_image.dart';

class EditProfileScreenBody extends StatelessWidget {
  const EditProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(),
            const CustomProfileImage(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 18,
            ),
            const CustomEditTextField(
              hintText: "Username",
              currentValue: "Mahmoud Alaa",
            ),
            const CustomEditTextField(
              hintText: "Password",
              currentValue: "*********",
            ),
            const CustomEditTextField(
              hintText: "Email",
              currentValue: "mahmoud.alaa1212@gmail.com",
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 8,
                  vertical: MediaQuery.of(context).size.width / 12),
              child: const CustomTextButton(text: "Save changes"),
            )
          ],
        ),
      ),
    );
  }
}
