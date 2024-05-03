import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/features/home/data/models/rocket_model.dart';
import 'package:spacex/features/home/logic/cubits/rocket_cubit/rocket_cubit.dart';
import 'package:spacex/features/home/ui/widgets/rocket_list_item.dart';
import '../../../../core/widgets/custom_failure_widget.dart';
import 'custom_loading_list_of_rockets.dart';

class RocketsListView extends StatelessWidget {
  const RocketsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 5.5,
      child: BlocBuilder<RocketCubit, RocketState>(
        builder: (context, state) {
          if (state is GetAllRocketsSuccess) {
            List<Rocket> rockets = (state).allRockets;
            return ListView.builder(
              itemBuilder: (context, index) {
                return RocketListItem(
                  imageUrl: rockets[index].flickrImages![0].toString(),
                  rocket: rockets[index],
                  isNetworkConnected:
                      state is GetAllRocketsFailure ==  true ? false : true,
                );
              },
              scrollDirection: Axis.horizontal,
              itemCount: rockets.length,
            );
          } else if (state is GetAllRocketsFailure) {
            return CustomFailureWidget(
              textError: state.errorMessage,
            );
          } else {
            return const CustomLoadingListOfRockets();
          }
        },
      ),
    );
  }
}
