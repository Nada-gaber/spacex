import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constant/colors.dart';

class CachedImage extends StatelessWidget {
  final String shipImage;

  const CachedImage({super.key, required this.shipImage});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: shipImage,
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
      errorWidget: (context, url, error) =>
          Image.asset("assets/images/no_connection.png"),
    );
  }
}