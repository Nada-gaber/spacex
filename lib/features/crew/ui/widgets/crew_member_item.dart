import 'package:flutter/material.dart';
import 'package:spacex/features/crew/data/models/person_model.dart';

import '../../../../core/constant/color/app_color.dart';
import '../../../../core/constant/colors.dart';
import '../views/crew_member_details_screen.dart';

class CrewMemberItem extends StatelessWidget {
  const CrewMemberItem({super.key, required this.crewMember});

  final CrewMemberModel crewMember;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return CrewMemberDetailsScreen(
              model: crewMember,
            );
          },
        ));
      },
      child: ClipRRect(
        borderRadius: BorderRadiusDirectional.circular(12),
        child: GridTile(
          footer: Container(
            padding: const EdgeInsetsDirectional.all(4),
            decoration:
                BoxDecoration(color: AppColors.buttonBlue.withOpacity(.7)),
            child: Text(
              crewMember.name,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 20,
                  color: AppColor.textColor),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          child: Hero(
            tag: crewMember.imageUrl,
            child: Image.network(
              crewMember.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
