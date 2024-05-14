import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/utils/database_helper.dart';
import 'package:spacex/features/ships/ui/ship_detail.dart';
import '../../../../core/utils/nonetwork_toast.dart';
import '../../../saved_items/data/repo/saved_item_repo.dart';
import '../../../saved_items/logic/cubits/saved_items_cubit.dart';
import 'ship_container_desing.dart';

shipContainer(
    BuildContext context,
    String shipImage,
    String shipName,
    int yearBuilt,
    int mass,
    String type,
    bool isNetworkConnected,
    bool isActive,
    String homePort) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: InkWell(
        borderRadius: BorderRadius.circular(20),
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: isNetworkConnected
            ? () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  BlocProvider(
                    create: (context) => SavedItemsCubit(SavedItemsRepo(DataBaseHelper())),
                    child: ShipDetails(
                      shipImage: shipImage,
                      shipName: shipName,
                      yearBuilt: yearBuilt,
                      mass: mass,
                      type: type,
                      isActive: isActive,
                      homePort: homePort,
                    ),
                  ),
                );
              }
            : () {
                showToastNoNetwork(
                  context,
                );
              },
        child: ContainerShipDesign(
            shipImage: shipImage,
            shipName: shipName,
            isActive: isActive,
            homePort: homePort)),
  );
}
