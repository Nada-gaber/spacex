import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

detailImageContainer(BuildContext context, String shipImage, String shipName) {
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
            child: CachedNetworkImage(
              imageUrl: shipImage,
              placeholder: (context, url) => const Padding(
                padding: EdgeInsets.all(20.0),
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Icon(Icons.error),
                    Text('no network connection'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
