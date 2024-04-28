import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/constant/colors.dart';
import 'package:spacex/features/home/logic/get_profile_data_cubit.dart';
import 'package:spacex/features/home/ui/widgets/profile_image_bloc_builder.dart';
import '../../logic/cubits/rocket_cubit/rocket_cubit.dart';
import '../widgets/custom_drawer_widget.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            child: const ProfileImageBlocBuilder(),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: const HomeScreenBody(),
      backgroundColor: AppColors.backgroundDarkBlue,
    );
  }
}
