import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/constant/colors.dart';
import 'package:spacex/core/functions/show_custom_dialog.dart';
import 'package:spacex/core/routing/extensions.dart';
import 'package:spacex/core/routing/routes.dart';
import 'package:spacex/core/themes/text_styles.dart';
import 'package:spacex/features/edit_profile/logic/edit_profile_data/edit_profile_data_cubit.dart';
import 'package:spacex/features/edit_profile/logic/upload_profile_image/upload_profile_image_cubit.dart';
import 'package:spacex/features/edit_profile/ui/widgets/custom_edit_profile_loading.dart';
import 'package:spacex/features/home/logic/get_profile_data/get_profile_data_cubit.dart';

import '../widgets/edit_profile_screen_body.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  void initState() {
    context.read<GetProfileDataCubit>().getProfileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        showCustomDialog(
          context,
          () async {
            if (context.read<UploadProfileImageCubit>().imagePath != null) {
              await FirebaseStorage.instance
                  .ref('profile')
                  .child(context.read<UploadProfileImageCubit>().imagePath!)
                  .delete()
                  .then((value) {
                context.pushNamedAndRemoveUntil(
                  Routes.home,
                  predicate: (route) => false,
                );
              });
            } else {
              context.pushNamedAndRemoveUntil(
                Routes.home,
                predicate: (route) => false,
              );
            }
          },
        );
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundDarkBlue,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundDarkBlue,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
            ),
            onPressed: () {
              showCustomDialog(
                context,
                () async {
                  if (context.read<UploadProfileImageCubit>().imagePath !=
                      null) {
                    await FirebaseStorage.instance
                        .ref('profile')
                        .child(
                            context.read<UploadProfileImageCubit>().imagePath!)
                        .delete()
                        .then((value) {
                      context.pushNamedAndRemoveUntil(
                        Routes.home,
                        predicate: (route) => false,
                      );
                    });
                  } else {
                    context.pushNamedAndRemoveUntil(
                      Routes.home,
                      predicate: (route) => false,
                    );
                  }
                },
              );
            },
            color: Colors.white,
          ),
          title: const Text(
            "Edit Profile",
            style: MyTextStyles.font20WhiteW600,
          ),
        ),
        body: Column(
          children: [
            BlocBuilder<GetProfileDataCubit, GetProfileDataState>(
              builder: (context, state) {
                if (state is GetProfileDataSuccess) {
                  context.read<EditProfileDataCubit>().nameController.text =
                      state.userModel.name;
                  context.read<EditProfileDataCubit>().profileImageUrl =
                      state.userModel.image;
                  return const EditProfileScreenBody();
                } else if (state is GetProfileDataFailure) {
                  return Center(
                    child: Text(
                      state.errorMessage,
                      style: MyTextStyles.font18WhiteBold,
                    ),
                  );
                } else {
                  return const CustomEditProfileLoading();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
