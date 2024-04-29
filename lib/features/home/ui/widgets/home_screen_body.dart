import 'package:flutter/material.dart';
import 'package:spacex/features/home/ui/widgets/rockets_list_view.dart';

import 'custom_message_box_widget.dart';
import 'launch_pad_list_view.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomMessageBoxWidget(screenWidth: screenWidth),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Rockets 🚀",
                    style: TextStyle(
                        fontSize: screenWidth / 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const RocketsListView(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "launch pads 🚩",
                    style: TextStyle(
                        fontSize: screenWidth / 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: LaunchPadListView(),
          ),
        ],
      ),
    );
  }
}
