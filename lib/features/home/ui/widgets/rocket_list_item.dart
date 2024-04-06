import 'package:flutter/material.dart';

class RocketListItem extends StatelessWidget {
  const RocketListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadiusDirectional.circular(16),
          child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.network(
                "https://farm1.staticflickr.com/929/28787338307_3453a11a77_b.jpg",
                fit: BoxFit.fill,
              )),
        ),
      ),
    );
  }
}
