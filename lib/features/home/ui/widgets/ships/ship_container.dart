import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spacex/core/constant/color/app_color.dart';
import '../../../../../core/constant/image/app_images.dart';
import '../../views/ships/ship_detail.dart';

shipContainer(BuildContext context,
    {String shipImage = AppImage.firstOnboarding,
    String shipName = 'Ship Name'}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
        borderRadius: BorderRadius.circular(20),
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ShipDetails(
                      shipImage: shipImage,
                      shipName: shipName,
                    )),
          );
        },
        child: containerShipDesign(context)),
  );
}

containerShipDesign(BuildContext context,
    {String shipImage = AppImage.firstOnboarding,
    String shipName = 'Ship Name'}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(
          color: AppColor.blueGrey,
          spreadRadius: -5.0,
          blurRadius: 7.0,
        ),
      ],
      image: DecorationImage(fit: BoxFit.fill, image: AssetImage(shipImage)),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border,
                  size: 30,
                  color: AppColor.textColor,
                ))),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
            child: Text(
              shipName,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    ),
  );
}
