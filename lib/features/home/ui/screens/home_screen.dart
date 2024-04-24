import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/constant/colors.dart';

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
    BlocProvider.of<RocketCubit>(context).getAllRockets();
    super.initState();
  }

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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: screenWidth / 15,
                backgroundImage: const NetworkImage(
                    "https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
              ),
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
