import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/widgets/custom_failure_widget.dart';
import 'package:spacex/features/home/data/models/launch_pad_model.dart';
import 'package:spacex/features/home/logic/cubits/launch_pads_cubit/launch_pads_cubit.dart';
import 'custom_loading_list_launch_pads.dart';
import 'launch_pad_item_widget.dart';

class LaunchPadListView extends StatelessWidget {
  const LaunchPadListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LaunchPadsCubit, LaunchPadsState>(
      builder: (context, state) {
        if (state is LaunchPadsLoadedSuccess) {
          List<LaunchPad> allLaunchPads = state.allLaunchPads;
          return ListView.builder(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: allLaunchPads.length,
            itemBuilder: (context, index) {
              return LaunchPadItem(
                launchPad: allLaunchPads[index],
                title: allLaunchPads[index].fullName.toString(),
                imageUrl: allLaunchPads[index].images!.large![0].toString(),
                location: allLaunchPads[index].locality.toString(),
                isNetworkConnected:
                    state is LaunchPadsLoadedFailure == true ? true : false,
              );
            },
          );
        } else if (state is LaunchPadsLoadedFailure) {
          return CustomFailureWidget(
            textError: state.errorMessage,
          );
        } else {
          return const CustomLoadingListOfLaunchPads();
        }
      },
    );
  }
}
