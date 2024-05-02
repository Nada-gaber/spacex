import 'package:flutter/material.dart';
import 'package:spacex/core/constant/colors.dart';
import 'package:spacex/core/themes/text_styles.dart';
import 'package:spacex/features/ships/ui/widgets/detail_row.dart';

import 'widgets/container_image.dart';
import 'widgets/ship_detail_app_bar.dart';

class ShipDetails extends StatelessWidget {
  final String shipImage;
  final String shipName;
  final int yearBuilt;
  final int mass;
  final String type;

  const ShipDetails(
      {required this.shipImage,
      required this.shipName,
      super.key,
      required this.yearBuilt,
      required this.mass,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDarkBlue,
      appBar: shipDetailAppBar(shipName),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          detailImageContainer(context, shipImage, shipName),
          const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 15, bottom: 20),
            child: Text(
              'Details',
              style: MyTextStyles.font30WhiteBold,
            ),
          ),
          detailsValuesRow('Year built :', yearBuilt),
          detailsValuesRow('Mass Kg:', mass),
          detailsValuesRow('Type :', type),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
