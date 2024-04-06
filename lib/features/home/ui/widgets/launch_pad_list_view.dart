import 'package:flutter/material.dart';

import 'launch_pad_item_widget.dart';

class LaunchPadListView extends StatelessWidget {
  const LaunchPadListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const LaunchPadItem();
      },
    );
  }
}
