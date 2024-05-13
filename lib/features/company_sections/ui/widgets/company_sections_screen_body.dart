import 'package:flutter/material.dart';
import 'package:spacex/features/company_sections/models/company_section_model.dart';
import 'package:spacex/features/company_sections/ui/widgets/company_sections_list_view_item.dart';

class CompanySectionsScreenBody extends StatefulWidget {
  const CompanySectionsScreenBody({super.key});

  @override
  State<CompanySectionsScreenBody> createState() =>
      _CompanySectionsScreenBodyState();
}

class _CompanySectionsScreenBodyState extends State<CompanySectionsScreenBody> {
  List<CompanySectionModel> companySections = [
    CompanySectionModel(
      title: 'Ships',
      image: 'assets/images/ships.jpg',
    ),
    CompanySectionModel(
      title: 'Crew',
      image: 'assets/images/crew.jpg',
    ),
    CompanySectionModel(
      title: 'About',
      image: 'assets/images/about.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
      child: ListView.builder(
        itemBuilder: (context, index) => CompanySectionsListViewItem(
          companySection: companySections[index],
        ),
        itemCount: companySections.length,
      ),
    );
  }
}
