import 'package:flutter/material.dart';
import 'package:spacex/features/company_sections/models/company_section_model.dart';

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
      image: '',
    ),
    CompanySectionModel(
      title: 'Crew',
      image: '',
    ),
    CompanySectionModel(
      title: 'About',
      image: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return;
        },
        itemCount: companySections.length,
      ),
    );
  }
}
