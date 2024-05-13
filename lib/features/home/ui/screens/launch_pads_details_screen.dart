import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/constant/colors.dart';
import 'package:spacex/features/home/data/models/launch_pad_model.dart';

import '../../../../core/utils/database_helper.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../../../../core/widgets/saved_floating_action_button.dart';
import '../../../saved_items/data/models/saved_item.dart';
import '../../../saved_items/logic/cubits/saved_items_cubit.dart';
import '../widgets/launch_pads_details_screen_body.dart';

class LaunchPadsDetailsScreen extends StatefulWidget {
  final LaunchPad launchPad;

  const LaunchPadsDetailsScreen({super.key, required this.launchPad});

  @override
  State<LaunchPadsDetailsScreen> createState() => _LaunchPadsDetailsScreenState();
}

class _LaunchPadsDetailsScreenState extends State<LaunchPadsDetailsScreen> {

  @override
  void initState() {
    BlocProvider.of<SavedItemsCubit>(context)
        .checkIsSaved(widget.launchPad.fullName.toString());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SavedItemModel savedItem = SavedItemModel(
        id: null,
        title: widget.launchPad.fullName.toString(),
        imageUrl: widget.launchPad.images!.large![0].toString(),
        country: widget.launchPad.locality.toString(),
        type: "Launch Pad");
    DataBaseHelper db = DataBaseHelper();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDarkBlue,
        title: Text(
          widget.launchPad.name.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      backgroundColor: AppColors.backgroundDarkBlue,
      body: LaunchPadsDetailsScreenBody(
        launchPad: widget.launchPad,
      ),
      floatingActionButton:  BlocBuilder<SavedItemsCubit, SavedItemsState>(
        builder: (context, state) {
          if (state is ItemIsSaved) {
            return SavedFloatingActionButton(
              icon: state.isSaved ? Icons.star : Icons.star_border,
              onPressed: ()  {
                state.isSaved
                    ?  db.delete(widget.launchPad.fullName.toString())
                    :  db.saveItem(savedItem);
                BlocProvider.of<SavedItemsCubit>(context)
                    .checkIsSaved(widget.launchPad.fullName.toString());
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
