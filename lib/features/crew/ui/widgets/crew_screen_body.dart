import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/themes/text_styles.dart';
import 'package:spacex/features/crew/logic/get_all_crew/get_all_crew_cubit.dart';
import 'package:spacex/features/crew/ui/widgets/custom_crew_loading.dart';

import 'crew_member_item.dart';

class CrewScreenBody extends StatelessWidget {
  const CrewScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllCrewCubit, GetAllCrewState>(
      builder: (context, state) {
        if (state is GetAllCrewSuccess) {
          return GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3.1,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              return CrewMemberItem(
                crewMember: state.crews[index],
                isNetworkConnected:
                    state is GetAllCrewFailure == true ? true : false,
              );
            },
            itemCount: state.crews.length,
          );
        } else if (state is GetAllCrewFailure) {
          return Center(
            child: Text(
              state.errorMessage,
              style: MyTextStyles.font20WhiteW600,
            ),
          );
        } else {
          return const CustomCrewLoading();
        }
      },
    );
  }
}
