import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DisplayingImagesWidget extends StatelessWidget {
  final int lengthOfImagesList;
  final List<String>? images;

  const DisplayingImagesWidget(
      {super.key, required this.lengthOfImagesList, required this.images});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: lengthOfImagesList,
      itemBuilder: (context, index, realIndex) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
              borderRadius: BorderRadiusDirectional.circular(16),
              child: Image.network(
                images![index].toString(),
                height: MediaQuery.of(context).size.height / 3.2,
                fit: BoxFit.cover,
              )),
        );
      },
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height / 3.2,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
      ),
    );
  }
}
