import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/constant/colors.dart';
import 'package:spacex/core/widgets/text_color_animation.dart';
import 'package:spacex/core/widgets/text_style.dart';
import 'package:spacex/features/saved_items/logic/cubits/saved_items_cubit.dart';
import 'package:spacex/features/ships/ui/widgets/detail_row.dart';

import '../../../core/utils/database_helper.dart';
import '../../../core/widgets/saved_floating_action_button.dart';
import '../../saved_items/data/models/saved_item.dart';
import 'widgets/container_image.dart';
import 'widgets/row_is_active.dart';
import 'widgets/ship_detail_app_bar.dart';

class ShipDetails extends StatefulWidget {
  final String shipImage;
  final String shipName;
  final int yearBuilt;
  final int mass;
  final String type;
  final bool isNetworkConnected;
  final bool isActive;
  final String homePort;

  const ShipDetails({
    super.key,
    required this.shipImage,
    required this.shipName,
    this.isNetworkConnected = true,
    required this.yearBuilt,
    required this.mass,
    required this.type,
    required this.isActive,
    required this.homePort,
  });

  @override
  State<ShipDetails> createState() => _ShipDetailsState();
}

class _ShipDetailsState extends State<ShipDetails> {
  @override
  void initState() {
    BlocProvider.of<SavedItemsCubit>(context).checkIsSaved(widget.shipName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DataBaseHelper db = DataBaseHelper();
    SavedItemModel savedItem = SavedItemModel(
        id: null,
        title: widget.shipName,
        imageUrl: widget.shipImage,
        country: widget.yearBuilt.toString(),
        type: "Ship");
    return Scaffold(
      backgroundColor: AppColors.backgroundDarkBlue,
      appBar: shipDetailAppBar(widget.shipName),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20.0, top: 10, bottom: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              detailImageContainer(context, widget.shipImage, widget.shipName,
                  widget.isNetworkConnected),
              const SizedBox(
                height: 20,
              ),
              const TextColorAnimation(
                textAnimated: 'Details :',
                fontSize: 23,
                padding: 0,
                alignment: Alignment.centerLeft,
              ),
              const SizedBox(
                height: 10,
              ),
              textStyle('Is ${widget.shipName} Active?', 17),
              RowIsActive(isActive: widget.isActive),
              const SizedBox(
                height: 10,
              ),
              textStyle('Home : ${widget.homePort}', 17),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                endIndent: 30,
                indent: 30,
              ),
              const SizedBox(
                height: 15,
              ),
              const TextColorAnimation(
                textAnimated: 'More Info :',
                fontSize: 23,
                padding: 0,
                alignment: Alignment.centerLeft,
              ),
              const SizedBox(
                height: 10,
              ),
              detailsValuesRow('Year built :', widget.yearBuilt),
              detailsValuesRow('Mass Kg:', widget.mass),
              detailsValuesRow('Type :', widget.type),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: BlocBuilder<SavedItemsCubit, SavedItemsState>(
        builder: (context, state) {
          if (state is ItemIsSaved) {
            return SavedFloatingActionButton(
              icon: state.isSaved ? Icons.star : Icons.star_border,
              onPressed: () {
                state.isSaved
                    ? db.delete(widget.shipName)
                    : db.saveItem(savedItem);
                BlocProvider.of<SavedItemsCubit>(context)
                    .checkIsSaved(widget.shipName);
              },
            );
          } else {
            return FloatingActionButton(
              onPressed: () {},
              backgroundColor: AppColors.buttonBlue,
            );
          }
        },
      ),
    );
  }
}
