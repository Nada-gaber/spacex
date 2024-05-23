import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spacex/core/routing/extensions.dart';
import 'package:spacex/core/themes/text_styles.dart';
import 'package:spacex/core/widgets/custom_shimmer_loading.dart';
import 'package:spacex/core/widgets/open_url_in_browser_icon_button.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/widgets/custom_icon_button.dart';
import '../../data/models/crew_model.dart';

class CrewMemberDetailsScreen extends StatelessWidget {
  final CrewModel crewModel;

  const CrewMemberDetailsScreen({
    super.key,
    required this.crewModel,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundDarkBlue,
        body: Padding(
          padding: const EdgeInsets.only(
            right: 16.0,
            left: 16.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.03,
                ),
                Hero(
                  tag: crewModel.image,
                  child: ClipRRect(
                    borderRadius: BorderRadiusDirectional.circular(24),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          CachedNetworkImage(
                            imageUrl: crewModel.image,
                            fit: BoxFit.cover,
                            progressIndicatorBuilder: (context, url, progress) {
                              return CustomShimmerLoading(
                                child: Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.3,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              );
                            },
                          ),
                          Positioned(
                            top: 10,
                            left: 10,
                            child: CustomIconButton(
                              size: 32,
                              icon: Icons.arrow_back,
                              onTap: () {
                                context.pop();
                              },
                              isFontAwesomeIcons: false,
                              color: Colors.white,
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: OpenUrlInBrowserIconButton(
                              urlString: crewModel.wikipedia,
                              iconSize: 32,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          crewModel.name,
                          style: MyTextStyles.font18WhiteBold,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Icon(Icons.work_outline_rounded),
                      const SizedBox(width: 6),
                      Text(
                        crewModel.agency,
                        style: MyTextStyles.font18WhiteBold,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
