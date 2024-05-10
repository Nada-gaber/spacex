import 'package:flutter/material.dart';
import 'package:spacex/features/ships/ui/widgets/row_is_active.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/themes/text_styles.dart';

class ShipsContainerDetails extends StatelessWidget {
  final String shipName;
  final String homePort;
  final bool isActive;
  const ShipsContainerDetails(
      {super.key, required this.shipName, required this.homePort, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: AppColors.backgroundDarkBlue,
          boxShadow: [
            BoxShadow(
              spreadRadius: -5.0,
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  shipName,
                  style: MyTextStyles.font18WhiteBold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text('Home : $homePort'),
              Text('Is $shipName Active?'),
              RowIsActive(isActive: isActive)
            ],
          ),
        ),
      ),
    );
  }
}
