import 'package:flutter/material.dart';
import 'package:spacex/core/constant/color/app_color.dart';
import 'package:spacex/core/themes/text_styles.dart';
import 'package:spacex/features/home/ui/widgets/ships/details_widgets/button.dart';

import '../../widgets/ships/details_widgets/app_bar.dart';
import '../../widgets/ships/details_widgets/container_image.dart';
import '../../widgets/ships/details_widgets/detail_row.dart';

class ShipDetails extends StatelessWidget {
  String shipImage;
  String shipName;
  ShipDetails({required this.shipImage, required this.shipName, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: shipDetailAppBar(shipName),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          detailImageContainer(context, shipImage),
          const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 15, bottom: 20),
            child: Text(
              'Details',
              style: MyTextStyles.font25WhiteBoldW500,
            ),
          ),
          detailsValuesRow('year buit :', '20'),
          detailsValuesRow('mass :', '2007'),
          detailsValuesRow('type :', 'jhg'),
          const SizedBox(
            height: 30,
          ),
          detailButton(shipName),
        ],
      ),
    );
  }
}
