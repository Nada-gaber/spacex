import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/constant/colors.dart';
import 'package:spacex/features/home/logic/get_profile_data_cubit.dart';

import '../widgets/custom_drawer_widget.dart';
import '../widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDarkBlue,
        title: const Text(
          "SpaceX",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // navigate to profile page
            },
            child: BlocBuilder<GetProfileDataCubit, GetProfileDataState>(
              builder: (context, state) {
                if (state is GetProfileDataSuccess) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: screenWidth / 15,
                      backgroundImage: NetworkImage(
                        state.userModel.image,
                      ),
                    ),
                  );
                } else if (state is GetProfileDataFailure) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: screenWidth / 15,
                      backgroundImage: const NetworkImage(
                        '',
                      ),
                      onBackgroundImageError: (exception, stackTrace) => const Icon(
                        Icons.error_outline,
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: const HomeScreenBody(),
      backgroundColor: AppColors.backgroundDarkBlue,
    );
  }
}
