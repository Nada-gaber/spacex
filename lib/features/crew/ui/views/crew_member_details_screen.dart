import 'package:flutter/material.dart';
import 'package:spacex/core/routing/extensions.dart';

import '../../../../core/constant/color/app_color.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/widgets/custom_icon_button.dart';
import '../../data/models/person_model.dart';

class CrewMemberDetailsScreen extends StatelessWidget {
  const CrewMemberDetailsScreen({super.key, required this.model});

  final CrewMemberModel model;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundDarkBlue,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: model.imageUrl,
                child: ClipRRect(
                  borderRadius: BorderRadiusDirectional.circular(24),
                  child: SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * .85,
                    child: Stack(fit: StackFit.expand, children: [
                      Image.network(
                        model.imageUrl,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: CustomIconButton(
                          size: screenWidth / 9.5,
                          icon: Icons.arrow_back,
                          onTap: () {
                            context.pop();
                          },
                          isFontAwesomeIcons: false,
                          color: Colors.black,
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: CustomIconButton(
                          isFontAwesomeIcons: false,
                          size: screenWidth / 9.5,
                          icon: Icons.info_outline,
                          color: Colors.black,
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      model.name,
                      style: TextStyle(
                          fontSize: MediaQuery
                              .of(context)
                              .size
                              .width / 16,
                          color: AppColor.textColor,
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.work_outline_rounded),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          model.agencyName,
                          style: TextStyle(
                              fontSize: 20,
                              color: AppColor.textColor.withOpacity(.7),
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
