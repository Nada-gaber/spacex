import 'package:flutter/material.dart';
import 'package:spacex/core/constant/colors.dart';
import 'package:spacex/core/widgets/text_color_animation.dart';
import '../../../../core/constant/images.dart';
import '../../../../core/widgets/text_style.dart';
import 'buildin_column.dart';
import 'company_links_row.dart';

class CompanyInfoLoaded extends StatelessWidget {
  final String summary;
  final String companyInfoCeo;
  final String companyInfoEmployees;
  final String companyInfoVehicles;
  final String companyInfoFounded;
  final String companyInfoSummary;
  final String companyInfoLinksTwitter;
  final String companyInfoLinksWebsite;
  final String companyInfoLinksFlickr;
  const CompanyInfoLoaded(
      {super.key,
      required this.summary,
      required this.companyInfoCeo,
      required this.companyInfoEmployees,
      required this.companyInfoVehicles,
      required this.companyInfoFounded,
      required this.companyInfoSummary,
      required this.companyInfoLinksTwitter,
      required this.companyInfoLinksWebsite,
      required this.companyInfoLinksFlickr});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            textStyle(companyInfoCeo, 29),
            const TextColorAnimation(
              textAnimated: 'ceo of spaceX',
              fontSize: 15,
              padding: 0.0,
              alignment: Alignment.center,
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildInfoColumn(companyInfoEmployees, 'employees'),
                buildInfoColumn(companyInfoVehicles, 'launch'),
                buildInfoColumn(companyInfoFounded, 'founded'),
              ],
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: Image.asset(MyImages.elonMask),
            ),
            const Divider(
              height: 0,
              color: AppColors.blueGray,
              endIndent:30,
              indent: 30,
            ),
            const SizedBox(
              height: 10,
            ),
            const TextColorAnimation(
              textAnimated: 'SpaceX Info',
              fontSize: 27,
              padding: 35,
              alignment: Alignment.topLeft,
            ),
            const SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: textStyle(companyInfoSummary, 15),
              ),
            ),
            const SizedBox(height: 25),
            const Divider(
              color: AppColors.blueGray,
              endIndent: 30,
              indent: 30,
            ),
            const SizedBox(
              height: 12,
            ),
            const TextColorAnimation(
              textAnimated: 'Social Media:',
              fontSize: 27,
              padding: 35,
              alignment: Alignment.topLeft,
            ),
            const SizedBox(
              height: 20,
            ),
            companyLinkRow(companyInfoLinksTwitter, companyInfoLinksWebsite,
                companyInfoLinksFlickr),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}