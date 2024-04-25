import 'package:flutter/material.dart';

class DisplayingImagesWidget extends StatelessWidget {
  final int lengthOfImagesList;
  final List<String>? images;

  const DisplayingImagesWidget(
      {super.key, required this.lengthOfImagesList, required this.images});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: lengthOfImagesList,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
              borderRadius: BorderRadiusDirectional.circular(16),
              child: Image.network(
                images![index].toString(),
                height: MediaQuery.of(context).size.height / 3.2,
                fit: BoxFit.fill,
              )),
        );
      },
    );
  }
}
