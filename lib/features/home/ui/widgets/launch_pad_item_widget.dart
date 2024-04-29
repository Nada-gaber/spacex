import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spacex/core/routing/extensions.dart';
import 'package:spacex/core/routing/routes.dart';

import '../../../../core/constant/colors.dart';
import '../../data/models/launch_pad_model.dart';

class LaunchPadItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String location;
  final LaunchPad launchPad;
  const LaunchPadItem({super.key, required this.imageUrl, required this.title, required this.location, required this.launchPad});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 6),
      child: GestureDetector(
        onTap: () {
          context.pushNamed(Routes.launchPadDetails,arguments: launchPad);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight / 5.8,
              child: AspectRatio(
                aspectRatio: 1 / 1.2,
                child: ClipRRect(
                  borderRadius: BorderRadiusDirectional.circular(16),
                  child: Hero(
                    tag: launchPad.name.toString(),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.fill,
                    ),
                  )
                ),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //full name
                  Padding(
                    padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: 8, vertical: 8),
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: screenWidth / 20,
                          fontWeight: FontWeight.w500),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  //region(location)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: screenWidth / 15,
                        color: Colors.red,
                      ),
                      Flexible(
                        child: Text(
                          location,
                          style: TextStyle(
                              color: AppColors.blueGray,
                              fontSize: screenWidth / 24,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

