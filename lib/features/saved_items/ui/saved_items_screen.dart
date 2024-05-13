import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/themes/text_styles.dart';
import 'package:spacex/core/widgets/custom_loading_widget.dart';
import 'package:spacex/features/saved_items/logic/cubits/saved_items_cubit.dart';
import 'package:spacex/features/saved_items/ui/widgets/saved_item_widget.dart';

import '../../../core/constant/colors.dart';
import '../../profile/ui/widgets/profile_component.dart';

class SavedItemsScreen extends StatefulWidget {
  const SavedItemsScreen({super.key});

  @override
  State<SavedItemsScreen> createState() => _SavedItemsScreenState();
}

class _SavedItemsScreenState extends State<SavedItemsScreen> {
  @override
  void initState() {
    BlocProvider.of<SavedItemsCubit>(context).getSavedItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Saved Items",
          style: MyTextStyles.font20WhiteW600,
        ),
        backgroundColor: AppColors.backgroundDarkBlue,
      ),
      backgroundColor: AppColors.backgroundDarkBlue,
      body: Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(vertical: 12, horizontal: 16),
        child: BlocBuilder<SavedItemsCubit, SavedItemsState>(
          builder: (context, state) {
            if (state is GetSavedItemsSuccess) {
              if (state.savedItems.isEmpty) {
                return const Center(
                  child: Text(
                    "No Items Saved",
                    style: MyTextStyles.font25WhiteW800,
                  ),
                );
              } else {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    return SavedItemWidget(
                      id: state.savedItems[index].id!.toInt(),
                      country: state.savedItems[index].country.toString(),
                      type: state.savedItems[index].type.toString(),
                      title: state.savedItems[index].title.toString(),
                      imageUrl: state.savedItems[index].imageUrl.toString(),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsetsDirectional.symmetric(vertical: 16),
                      child: buildDivide(),
                    );
                  },
                  itemCount: state.savedItems.length,
                );
              }
            } else if (state is SavedItemsFailure) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else {
              return const Center(
                child: CustomLoadingWidget(),
              );
            }
          },
        ),
      ),
    );
  }
}
