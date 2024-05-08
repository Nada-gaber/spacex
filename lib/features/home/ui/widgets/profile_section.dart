import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spacex/core/widgets/custom_shimmer_loading.dart';
import 'package:spacex/features/home/logic/get_profile_data/get_profile_data_cubit.dart';
import 'package:spacex/features/home/ui/widgets/profile_section_loading.dart';

class ProfileSection extends StatelessWidget {
  final GetProfileDataState getProfileDataState;
  const ProfileSection({super.key, required this.getProfileDataState});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    if (getProfileDataState is GetProfileDataSuccess) {
      return Padding(
        padding: const EdgeInsetsDirectional.symmetric(vertical: 24),
        child: Column(
          children: [
            Container(
              height: screenHeight / 9.5,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: CachedNetworkImage(
                imageUrl: (getProfileDataState as GetProfileDataSuccess).userModel.image,
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) {
                  return CustomShimmerLoading(
                    child: Container(
                      height: screenHeight / 9.5,
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
            SizedBox(height: screenHeight * 0.015),
            Text(
              "Hi, ${(getProfileDataState as GetProfileDataSuccess).userModel.name}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    } else if (getProfileDataState is GetProfileDataFailure) {
      return Padding(
        padding: const EdgeInsetsDirectional.symmetric(vertical: 24),
        child: Center(
          child: Text(
            (getProfileDataState as GetProfileDataFailure).errorMessage,
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsetsDirectional.symmetric(vertical: 24),
        child: ProfileSectionLoading(
          screenHeight: screenHeight,
          screenWidth: screenWidth,
        ),
      );
    }
  }
}
