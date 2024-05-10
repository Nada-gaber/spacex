import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/constant/colors.dart';
import 'package:spacex/core/utils/database_helper.dart';
import 'package:spacex/core/widgets/custom_loading_widget.dart';
import 'package:spacex/core/widgets/saved_floating_action_button.dart';
import 'package:spacex/features/home/data/models/rocket_model.dart';
import 'package:spacex/features/saved_items/data/models/saved_item.dart';
import 'package:spacex/features/saved_items/logic/cubits/saved_items_cubit.dart';

import '../../../../core/widgets/open_url_in_browser_icon_button.dart';
import '../widgets/rocket_details_screen_body.dart';

class RocketDetailsScreen extends StatefulWidget {
  final Rocket rocket;

  const RocketDetailsScreen({super.key, required this.rocket});

  @override
  State<RocketDetailsScreen> createState() => _RocketDetailsScreenState();
}

class _RocketDetailsScreenState extends State<RocketDetailsScreen> {
  @override
  void initState() {
    BlocProvider.of<SavedItemsCubit>(context)
        .checkIsSaved(widget.rocket.name.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SavedItemModel savedItem = SavedItemModel(
        id: null,
        title: widget.rocket.name.toString(),
        imageUrl: widget.rocket.flickrImages![0].toString(),
        country: widget.rocket.country.toString(),
        type: "Rocket");
    DataBaseHelper db = DataBaseHelper();
    return Scaffold(
        backgroundColor: AppColors.backgroundDarkBlue,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundDarkBlue,
          title: Text(
            widget.rocket.name.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            OpenUrlInBrowserIconButton(
              urlString: widget.rocket.wikipedia.toString(),
            ),
          ],
        ),
        body: RocketDetailsScreenBody(
          rocket: widget.rocket,
        ),
        floatingActionButton: BlocBuilder<SavedItemsCubit, SavedItemsState>(
          builder: (context, state) {
            if (state is ItemIsSaved) {
              return SavedFloatingActionButton(
                icon: state.isSaved ? Icons.star : Icons.star_border,
                onPressed: () async {
                  state.isSaved
                      ? await db.delete(widget.rocket.name.toString())
                      : await db.saveItem(savedItem);
                },
              );
            } else {
              return const CustomLoadingWidget(color: AppColors.textWhite);
            }
          },
        ));
  }
}
