import 'package:flutter/material.dart';
import 'package:spacex/core/constant/colors.dart';

import '../widgets/crew_screen_body.dart';

class CrewScreen extends StatelessWidget {
  const CrewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crew",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.backgroundDarkBlue,
      ),
      backgroundColor: AppColors.backgroundDarkBlue,
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(
            horizontal: MediaQuery.of(context).size.width / 25,vertical: 12),
        child: const CrewScreenBody(),
      ),
    );
  }
}
