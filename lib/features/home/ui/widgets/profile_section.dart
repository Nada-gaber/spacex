import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/features/home/logic/get_profile_data_cubit.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsetsDirectional.symmetric(vertical: screenHeight / 20),
      child: BlocBuilder<GetProfileDataCubit, GetProfileDataState>(
        builder: (context, state) {
          if (state is GetProfileDataSuccess) {
            return Column(
              children: [
                Container(
                  height: screenHeight / 9.5,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          colors: [Colors.white, Colors.blueGrey])),
                  child: CircleAvatar(
                    radius: screenWidth / 9.5,
                    backgroundImage: NetworkImage(
                      state.userModel.image,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  state.userModel.name,
                  style: const TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                Text(
                  state.userModel.email,
                  style: const TextStyle(color: Colors.grey, fontSize: 16.0),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            );
          } else if (state is GetProfileDataFailure) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
