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
              child: Image.network(
                shipImage,
                fit: BoxFit.fill,
              ))),
    ),
  );
}
