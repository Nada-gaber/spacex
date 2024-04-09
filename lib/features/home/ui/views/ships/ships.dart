import 'package:flutter/material.dart';
import 'package:spacex/core/constant/color/app_color.dart';
import '../../../../../core/themes/text_styles.dart';
import '../../widgets/ships/ship_container.dart';

class Ships extends StatelessWidget {
  const Ships({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        title: const Text('Ships', style: MyTextStyles.font25WhiteBoldW500),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        children: [
          shipContainer(context),
          shipContainer(context),
          shipContainer(context),
        ],
      ),
    );
  }
}
