import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/widgets/custom_text_button.dart';
import 'package:spacex/core/widgets/custom_text_form_field.dart';
import 'package:spacex/features/edit_profile/logic/edit_profile_data_cubit.dart';
import 'custom_profile_image.dart';

class EditProfileScreenBody extends StatelessWidget {
  const EditProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 24,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomProfileImage(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 18,
            ),
            CustomTextFormField(
              icon: Icons.person_outline_outlined,
              text: context.read<EditProfileDataCubit>().nameController.text,
              controller: context.read<EditProfileDataCubit>().nameController,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.05,
            ),
            const CustomTextButton(
              text: "Save changes",
            )
          ],
        ),
      ),
    );
  }
}
