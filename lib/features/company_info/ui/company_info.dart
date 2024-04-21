import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spacex/core/constant/images.dart';
import 'package:spacex/core/widgets/custom_icon_button.dart';
import 'package:spacex/features/company_info/ui/widgets/buildin_column.dart';
import 'widgets/app_bar.dart';
import '../../../core/widgets/text_style.dart';

class CompanyInfoScreen extends StatelessWidget {
  const CompanyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: color constants isn't in this branch so i will edit it soon
      backgroundColor: const Color(0xff061428),
      appBar: companyInfoAppBar(context),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              textStyle('Elon Mask', 25),
              textStyle('ceo of spaceX', 15, fontWeight: FontWeight.w400),
              const SizedBox(height: 35),
              Row(
                children: [
                  buildInfoColumn('8000', 'employees'),
                  buildInfoColumn('3', 'launch'),
                  buildInfoColumn('2002', 'founded'),
                ],
              ),
              const SizedBox(height: 30),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIconButton(
                    icon: FontAwesomeIcons.twitter,
                    color: Colors.white,
                    size: 30,
                    isFontAwesomeIcons: true,
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(width: 10),
                  CustomIconButton(
                    icon: FontAwesomeIcons.globe,
                    color: Colors.white,
                    size: 30,
                    isFontAwesomeIcons: true,
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(width: 10),
                  CustomIconButton(
                    icon: FontAwesomeIcons.flickr,
                    color: Colors.white,
                    size: 30,
                    isFontAwesomeIcons: true,
                    backgroundColor: Colors.transparent,
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Image.asset(MyImages.elonMask),
            ],
          ),
        ),
      ),
    );
  }
}
