import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/widgets/custom_shimmer_loading.dart';
import 'package:spacex/features/edit_profile/logic/edit_profile_data_cubit.dart';
import '../../../../core/widgets/custom_icon_button.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
              return CustomShimmerLoading(
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.25,
                  width: MediaQuery.sizeOf(context).height * 0.25,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              );
            },
            errorWidget: (context, url, error) => const Icon(
              Icons.error_outline,
              size: 32,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 5,
          child: CustomIconButton(
            onTap: () {},
            size: 24,
            icon: Icons.edit,
            color: Colors.black,
            isFontAwesomeIcons: false,
            backgroundColor: Colors.white.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}
