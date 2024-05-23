import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spacex/core/constant/images.dart';

detailImageContainer(BuildContext context, String shipImage, String shipName,
    final bool isNetworkConnected) {
  return Center(
    child: Container(
      height: 250,
      width: MediaQuery.of(context).size.width - 20,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: Hero(
        tag: shipName,
        child: ClipRRect(
          borderRadius: BorderRadiusDirectional.circular(24),
          child: FittedBox(
              fit: BoxFit.fill,
              child: isNetworkConnected
                  ? CachedNetworkImage(
                      imageUrl: shipImage,
                      placeholder: (context, url) => const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => Image.asset("assets/images/no_connection.png"),
                    )
                  : Image.asset(MyImages.imageNotFound)),
        ),
      ),
    ),
  );
}