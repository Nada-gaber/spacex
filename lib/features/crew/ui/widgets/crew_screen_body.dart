import 'package:flutter/material.dart';
import 'package:spacex/features/crew/data/models/person_model.dart';

import 'crew_member_item.dart';

class CrewScreenBody extends StatelessWidget {
  const CrewScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3.1,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        return  CrewMemberItem(
          crewMember:CrewMemberModel(
            name: "Victor J. Glover",
                imageUrl: "https://i.imgur.com/1Ca8K9L.png",
            agencyName: "NASA",
            wikipediaLinK: "https://en.wikipedia.org/wiki/Victor_J._Glover"
          ) ,
        );
      },
      itemCount: 1,
    );
  }
}
