import 'package:flutter/material.dart';
import 'package:spacex/core/widgets/custom_app_bar.dart';
import 'package:spacex/features/company_sections/ui/widgets/company_sections_screen_body.dart';

class CompanySectionsScreen extends StatelessWidget {
  const CompanySectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
    children: [
      CustomAppBar(
        title: 'Sections',
      ),
      Expanded(
        child: CompanySectionsScreenBody(),
      ),
    ],
    );
  }
}
