import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/widgets/custom_app_bar.dart';
import 'package:spacex/features/home/logic/cubits/launch_pads_cubit/launch_pads_cubit.dart';
import 'package:spacex/features/home/logic/get_profile_data/get_profile_data_cubit.dart';
import 'package:spacex/features/home/ui/widgets/profile_image_bloc_builder.dart';
import '../../logic/cubits/rocket_cubit/rocket_cubit.dart';
import '../widgets/home_screen_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<GetProfileDataCubit>().getProfileData();
    BlocProvider.of<RocketCubit>(context).getAllRockets();
    BlocProvider.of<LaunchPadsCubit>(context).getAllLaunchPads();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProfileDataCubit, GetProfileDataState>(
      builder: (context, state) => Column(
        children: [
          CustomAppBar(
            title: 'SpaceX',
            leading: GestureDetector(
              onTap: () {
                // navigate to profile page
              },
              child: ProfileImageBlocBuilder(
                getProfileDataState: state,
              ),
            ),
          ),
          const Expanded(
            child: HomeScreenBody(),
          ),
        ],
      ),
    );
  }
}
