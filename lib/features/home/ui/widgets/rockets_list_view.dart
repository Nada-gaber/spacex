import 'package:flutter/material.dart';
import 'package:spacex/features/home/ui/widgets/rocket_list_item.dart';


class RocketsListView extends StatelessWidget {
  const RocketsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 5.5,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return const RocketListItem();
        },
        scrollDirection: Axis.horizontal,
        itemCount: 10,
      ),
    );
  }
}
