import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/widgets/custom_text_form_field.dart';
import 'package:spacex/features/edit_profile/logic/edit_profile_data/edit_profile_data_cubit.dart';
import 'package:spacex/features/edit_profile/ui/widgets/edit_profile_bloc_consumer.dart';
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
      child: Form(
        key: context.read<EditProfileDataCubit>().formKey,
        child: Column(
          children: [
            const CustomProfileImage(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 18,
            ),
            CustomTextFormField(
              suffixIcon: const Icon(
                Icons.person_outline_outlined,
                color: Colors.white,
              ),
              text: 'Please Enter Your Name',
              controller: context.read<EditProfileDataCubit>().nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Name must not be null';
                }
                return null;
              },
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.04,
            ),
            const EditProfileBlocConsumer(),
          ],
        ),
      ),
    );
  }
}
