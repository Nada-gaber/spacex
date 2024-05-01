import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spacex/core/constant/colors.dart';
import 'package:spacex/core/routing/extensions.dart';
import 'package:spacex/core/routing/routes.dart';
import 'package:spacex/core/widgets/custom_shimmer_loading.dart';
import 'package:spacex/features/home/data/models/rocket_model.dart';
import 'package:spacex/features/home/ui/widgets/custom_loading_list_of_rockets.dart';

class RocketListItem extends StatelessWidget {
  final String imageUrl;
  final Rocket rocket;

  const RocketListItem(
      {super.key, required this.imageUrl, required this.rocket});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.rocketDetails, arguments: rocket);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadiusDirectional.circular(16),
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.fill,
              progressIndicatorBuilder: (context, url, progress) {
                return Shimmer(
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.blueGray,
                      AppColors.buttonBlue,
                      Color.fromARGB(255, 23, 42, 63),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadiusDirectional.circular(16),
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Container(
                        color: Colors.blue,
                      ),
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
