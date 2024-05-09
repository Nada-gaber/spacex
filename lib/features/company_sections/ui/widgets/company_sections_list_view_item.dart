import 'package:flutter/material.dart';
import 'package:spacex/core/routing/extensions.dart';
import 'package:spacex/core/routing/routes.dart';
import 'package:spacex/core/themes/text_styles.dart';
import 'package:spacex/features/company_sections/models/company_section_model.dart';

class CompanySectionsListViewItem extends StatelessWidget {
  final CompanySectionModel companySection;
  const CompanySectionsListViewItem({super.key, required this.companySection});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              switch (companySection.title) {
                case 'Ships':
                  context.pushNamed(Routes.ships);
                  break;
                case 'Crew':
                  context.pushNamed(Routes.crewScreen);
                  break;
                case 'About':
                  context.pushNamed(Routes.companyInfo);
                  break;
              }
            },
            child: Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: DecorationImage(
                  image: AssetImage(
                    companySection.image,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Text(
            companySection.title,
            style: MyTextStyles.font25WhiteBoldW500,
          ),
        ],
      ),
    );
  }
}
