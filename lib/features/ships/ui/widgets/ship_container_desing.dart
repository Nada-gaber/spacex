import 'package:flutter/material.dart';
import 'package:spacex/core/constant/colors.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:spacex/core/widgets/text_color_animation.dart';
import 'package:spacex/features/ships/ui/widgets/cached_image.dart';
import 'package:spacex/features/ships/ui/widgets/ships_container_details.dart';

class ContainerShipDesign extends StatelessWidget {
  final String shipImage;
  final String shipName;
  final bool isActive;
  final String homePort;

  const ContainerShipDesign(
      {super.key,
      required this.shipImage,
      required this.shipName,
      required this.isActive,
      required this.homePort});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.backgroundDarkBlue,
        border: GradientBoxBorder(
          gradient: LinearGradient(colors: [Colors.blue, AppColors.blueGray]),
          width: 2,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            spreadRadius: -5.0,
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              child: Hero(
                tag: TextColorAnimation(
                  textAnimated: shipName,
                  fontSize: 13,
                  padding: 0,
                  alignment: Alignment.centerLeft,
                ),
                child: Container(
                  color: AppColors.backgroundDarkBlue,
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 3,
                  child: CachedImage(
                    shipImage: shipImage,
                  ),
                ),
              ),
            ),
          ),
          ShipsContainerDetails(
            shipName: shipName,
            homePort: homePort,
            isActive: isActive,
          ),
        ],
      ),
    );
  }
}
