import 'package:flutter/material.dart';
import '../../../../core/constant/images.dart';
import '../../../../core/widgets/text_style.dart';
import 'buildin_column.dart';
import 'company_info_appbar.dart';
import 'company_links_row.dart';

class CompanyInfoLoaded extends StatelessWidget {
  final String summary;
  final String companyInfoCeo;
  final String companyInfoEmployees;
  final String companyInfoVehicles;
  final String companyInfoFounded;

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
      required this.companyInfoLinksTwitter,
      required this.companyInfoLinksWebsite,
      required this.companyInfoLinksFlickr});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff061428),
      appBar: companyInfoAppBar(context, summary),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              textStyle(companyInfoCeo, 25),
              textStyle('ceo of spaceX', 15, fontWeight: FontWeight.w400),
              const SizedBox(height: 35),
              Row(
                children: [
                  buildInfoColumn(companyInfoEmployees, 'employees'),
                  buildInfoColumn(companyInfoVehicles, 'launch'),
                  buildInfoColumn(companyInfoFounded, 'founded'),
                ],
              ),
              const SizedBox(height: 45),
              companyLinkRow(companyInfoLinksTwitter, companyInfoLinksWebsite,
                  companyInfoLinksFlickr),
              const SizedBox(height: 25),
              Image.asset(MyImages.elonMask),
            ],
          ),
        ),
      ),
    );
  }
}
