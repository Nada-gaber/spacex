import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/features/home/logic/get_profile_data_cubit.dart';
import 'package:spacex/features/home/ui/widgets/profile_image_loading.dart';

class ProfileImageBlocBuilder extends StatelessWidget {
  const ProfileImageBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<GetProfileDataCubit, GetProfileDataState>(
        builder: (context, state) {
          if (state is GetProfileDataSuccess) {
            return Container(
              height: MediaQuery.sizeOf(context).height * 0.1,
              width: MediaQuery.sizeOf(context).height * 0.1,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: CachedNetworkImage(
                imageUrl: state.userModel.image,
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) {
                  return const ProfileImageLoading();
                },
                errorWidget: (context, url, error) => const Icon(
                  Icons.error_outline,
                ),
              ),
            );
          } else if (state is GetProfileDataFailure) {
            return CircleAvatar(
              radius: screenWidth / 15,
              backgroundColor: Colors.transparent,
              child: const Icon(Icons.error_outline),
            );
          } else {
            return const ProfileImageLoading();
          }
        },
      ),
    );
  }
}
