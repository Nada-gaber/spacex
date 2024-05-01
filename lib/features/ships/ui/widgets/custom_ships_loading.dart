import 'package:flutter/material.dart';
import 'package:spacex/core/widgets/custom_shimmer_loading.dart';

class CustomShipsLoading extends StatelessWidget {
  const CustomShipsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: CustomShimmerLoading(
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              height: MediaQuery.sizeOf(context).height * 0.3,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
