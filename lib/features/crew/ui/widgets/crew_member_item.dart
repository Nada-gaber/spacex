import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spacex/core/themes/text_styles.dart';
import 'package:spacex/core/widgets/custom_shimmer_loading.dart';
import 'package:spacex/features/crew/data/models/crew_model.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/utils/nonetwork_toast.dart';
import '../views/crew_member_details_screen.dart';

class CrewMemberItem extends StatelessWidget {
  const CrewMemberItem(
      {super.key, required this.crewMember, required this.isNetworkConnected});

  final CrewModel crewMember;
  final bool isNetworkConnected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isNetworkConnected
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CrewMemberDetailsScreen(
                      crewModel: crewMember,
                    );
                  },
                ),
              );
            }
          : () {
              showToastNoNetwork(
                context,
              );
            },
      child: ClipRRect(
        borderRadius: BorderRadiusDirectional.circular(12),
        child: GridTile(
          footer: Container(
            padding: const EdgeInsetsDirectional.all(4),
            decoration:
                BoxDecoration(color: AppColors.buttonBlue.withOpacity(.7)),
            child: Text(
              crewMember.name,
              style: MyTextStyles.font18WhiteBold,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
          child: Hero(
            tag: crewMember.image,
            child: CachedNetworkImage(
              imageUrl: crewMember.image,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, progress) {
                return CustomShimmerLoading(
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
