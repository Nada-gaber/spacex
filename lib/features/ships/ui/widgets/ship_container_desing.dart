import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spacex/core/constant/colors.dart';
import 'package:spacex/core/constant/images.dart';
import 'package:spacex/core/themes/text_styles.dart';

containerShipDesign(BuildContext context, String shipImage, String shipName) {
  return Column(
    children: [
      Container(
        height: MediaQuery.of(context).size.height / 4,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              spreadRadius: -5.0,
              blurRadius: 6.0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: Stack(
            children: [
              Shimmer(
                gradient: const LinearGradient(
                  colors: [
                    AppColors.blueGray,
                    AppColors.buttonBlue,
                    Color.fromARGB(255, 23, 42, 63),
                  ],
                  stops: [
                    0.1,
                    0.3,
                    0.4,
                  ],
                  begin: Alignment(-1.0, -0.3),
                  end: Alignment(1.0, 0.3),
                  tileMode: TileMode.clamp,
                ),
                child: Container(
                  color: Colors.grey[200],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: shipImage.isNotEmpty
                        ? DecorationImage(
                            fit: BoxFit.fill, image: NetworkImage(shipImage))
                        : const DecorationImage(
                            fit: BoxFit.fill, image: NetworkImage(MyImages.imageNotFound))),
              ),
            ],
          ),
        ),
      ),
      Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          color: AppColors.buttonBlue,
          boxShadow: [
            BoxShadow(
              spreadRadius: -5.0,
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
            child: Text(
              shipName,
              style: MyTextStyles.font18WhiteBold,
            ),
          ),
        ),
      ),
    ],
  );
}
