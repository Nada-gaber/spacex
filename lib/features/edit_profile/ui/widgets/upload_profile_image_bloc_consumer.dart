import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/features/edit_profile/logic/edit_profile_data/edit_profile_data_cubit.dart';
import 'package:spacex/features/edit_profile/logic/upload_profile_image/upload_profile_image_cubit.dart';
import 'package:spacex/features/edit_profile/ui/widgets/custom_profile_image_loading.dart';

class UploadProfileImageBlocConsumer extends StatelessWidget {
  const UploadProfileImageBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadProfileImageCubit, UploadProfileImageState>(
      listener: (context, state) {
        if (state is UploadProfileImageSuccess) {
          context.read<EditProfileDataCubit>().profileImageUrl =
              state.imageUrl;
        } else if(state is UploadProfileImageFailure) {
          // Todo showToast ==> failed to upload profile image
        }
      },
      builder: (context, state) {
        return Container(
          height: MediaQuery.sizeOf(context).height * 0.2,
          width: MediaQuery.sizeOf(context).height * 0.2,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: CachedNetworkImage(
            imageUrl: context.read<EditProfileDataCubit>().profileImageUrl,
            fit: BoxFit.fill,
            progressIndicatorBuilder: (context, url, downloadProgress) {
              return const CustomProfileImageLoading();
            },
            errorWidget: (context, url, error) => const Icon(
              Icons.error_outline,
              size: 32,
            ),
          ),
        );
        if (state is UploadProfileImageSuccess) {
          return Container(
            height: MediaQuery.sizeOf(context).height * 0.2,
            width: MediaQuery.sizeOf(context).height * 0.2,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: CachedNetworkImage(
              imageUrl: state.imageUrl ??
                  context.read<EditProfileDataCubit>().profileImageUrl,
              fit: BoxFit.fill,
              progressIndicatorBuilder: (context, url, downloadProgress) {
                return const CustomProfileImageLoading();
              },
              errorWidget: (context, url, error) => const Icon(
                Icons.error_outline,
                size: 32,
              ),
            ),
          );
        } else if (state is UploadProfileImageFailure) {
          return const Center(
            child: Icon(
              Icons.error_outline,
              size: 32,
            ),
          );
        } else {
          return const CustomProfileImageLoading();
        }
      },
    );
  }
}
