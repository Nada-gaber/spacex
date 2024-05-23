import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/themes/text_styles.dart';
import 'package:spacex/core/widgets/custom_shimmer_loading.dart';
import 'package:spacex/features/home/logic/get_profile_data/get_profile_data_cubit.dart';
import 'package:spacex/features/profile/ui/widgets/profile_section_loading.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProfileDataCubit, GetProfileDataState>(
      builder: (context, state) {
        if (state is GetProfileDataSuccess) {
          return Padding(
            padding: const EdgeInsetsDirectional.symmetric(vertical: 24),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.15,
                  width: MediaQuery.sizeOf(context).height * 0.15,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: state.userModel.image,
                    height: MediaQuery.sizeOf(context).height * 0.15,
                    width: MediaQuery.sizeOf(context).height * 0.15,
                    fit: BoxFit.fill,
                    progressIndicatorBuilder: (context, url, downloadProgress) {
                      return CustomShimmerLoading(
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * 0.15,
                          width: MediaQuery.sizeOf(context).height * 0.15,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error_outline,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                Text(
                  "Hi, ${state.userModel.name}",
                  style: MyTextStyles.font18WhiteBold,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        } else if (state is GetProfileDataFailure) {
          return Padding(
            padding: const EdgeInsetsDirectional.symmetric(vertical: 24),
            child: Center(
              child: Text(
                state.errorMessage,
              ),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsetsDirectional.symmetric(vertical: 24),
            child: ProfileSectionLoading(
              screenHeight: MediaQuery.sizeOf(context).height,
              screenWidth: MediaQuery.sizeOf(context).width,
            ),
          );
        }
      },
    );
  }
}
