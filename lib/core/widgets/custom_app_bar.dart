import 'package:flutter/material.dart';
import 'package:spacex/core/themes/text_styles.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Widget? leading;

  const CustomAppBar({super.key, this.leading, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 24),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.06,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: MyTextStyles.font25WhiteBoldW500,
            ),
            leading ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
