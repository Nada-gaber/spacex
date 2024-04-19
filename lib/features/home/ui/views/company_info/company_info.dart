import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spacex/core/constant/images.dart';
import '../../widgets/button_widgets/icon_button.dart';
import '../../widgets/company_info_widgets.dart/app_bar.dart';
import '../../widgets/company_info_widgets.dart/buildin_column.dart';
import '../../widgets/text_widget/text_style.dart';

class CompanyInfoScreen  extends StatelessWidget {
  const CompanyInfoScreen ({super.key});

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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconButton(FontAwesomeIcons.twitter, onPressed: () {}),
                  iconButton(FontAwesomeIcons.globe, onPressed: () {}),
                  iconButton(FontAwesomeIcons.flickr, onPressed: () {}),
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
