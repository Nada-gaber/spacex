import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/constant/colors.dart';
import 'package:spacex/core/themes/text_styles.dart';
import 'package:spacex/features/saved_items/logic/cubits/saved_items_cubit.dart';
import 'package:spacex/features/ships/ui/widgets/detail_row.dart';

import '../../../core/utils/database_helper.dart';
import '../../../core/widgets/custom_loading_widget.dart';
import '../../../core/widgets/saved_floating_action_button.dart';
import '../../saved_items/data/models/saved_item.dart';
import 'widgets/container_image.dart';
import 'widgets/ship_detail_app_bar.dart';

class ShipDetails extends StatefulWidget {
  final String shipImage;
  final String shipName;
  final int yearBuilt;
  final int mass;
  final String type;
  final bool isNetworkConnected;

  const ShipDetails({
    required this.shipImage,
    required this.shipName,
    super.key,
    required this.yearBuilt,
    required this.mass,
    required this.type,
    this.isNetworkConnected = true,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            detailImageContainer(context, widget.shipImage, widget.shipName,
                widget.isNetworkConnected),
            const Padding(
              padding: EdgeInsets.only(left: 10.0, top: 15, bottom: 20),
              child: Text(
                'Details',
                style: MyTextStyles.font30WhiteBold,
              ),
            ),
            detailsValuesRow('Year built :', widget.yearBuilt),
            detailsValuesRow('Mass Kg:', widget.mass),
            detailsValuesRow('Type :', widget.type),
            const SizedBox(
              height: 30,
            ),
          ],
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
            return const CustomLoadingWidget(color: AppColors.textWhite);
          }
        },
      ),
    );
  }
}
