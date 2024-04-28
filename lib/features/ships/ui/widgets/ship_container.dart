import 'package:flutter/material.dart';
import 'package:spacex/features/ships/ui/ship_detail.dart';
import 'ship_container_desing.dart';

shipContainer(BuildContext context, String shipImage, String shipName,
    int yearBuilt, int mass, String type) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
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
                yearBuilt: yearBuilt,
                mass: mass,
                type: type,
              ),
            ),
          );
        },
        child: containerShipDesign(context, shipImage, shipName)),
  );
}

