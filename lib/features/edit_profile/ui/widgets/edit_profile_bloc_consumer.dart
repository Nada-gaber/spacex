import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/routing/extensions.dart';
import 'package:spacex/core/routing/routes.dart';
import 'package:spacex/core/widgets/custom_text_button.dart';
import 'package:spacex/features/edit_profile/logic/edit_profile_data/edit_profile_data_cubit.dart';
import 'package:spacex/features/edit_profile/logic/edit_profile_data/edit_profile_data_state.dart';
import 'package:spacex/features/home/data/models/user_model.dart';

class EditProfileBlocConsumer extends StatelessWidget {
  const EditProfileBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    bool requestLoading = false;
    return BlocConsumer<EditProfileDataCubit, EditProfileDataState>(
      listener: (context, state) {
        if (state is EditProfileDataLoading) {
          requestLoading = true;
        } else if (state is EditProfileDataSuccess) {
          // showToast(text: 'Profile updated successfully');
          context.pushNamedAndRemoveUntil(
            Routes.home,
            predicate: (route) => false,
          );
          requestLoading = false;
        } else if (state is EditProfileDataFailure) {
          // showToast(text: state.errorMessage);
          requestLoading = false;
        }
      },
      builder: (context, state) {
        return CustomTextButton(
          text: 'Save',
          requestLoading: requestLoading,
          onPressed: () {
            UserModel userModel = UserModel(
              name: context.read<EditProfileDataCubit>().nameController.text,
              image: context.read<EditProfileDataCubit>().profileImageUrl,
              token: 'GtummCYmQxNFLpBlT5iT',
            );
            if (context
                .read<EditProfileDataCubit>()
                .formKey
                .currentState!
                .validate()) {
              context.read<EditProfileDataCubit>().editProfileData(userModel);
            }
          },
        );
      },
    );
  }
}
