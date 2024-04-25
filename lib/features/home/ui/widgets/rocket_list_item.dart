import 'package:flutter/material.dart';
import 'package:spacex/core/routing/extensions.dart';
import 'package:spacex/core/routing/routes.dart';
import 'package:spacex/features/home/data/models/rocket_model.dart';

class RocketListItem extends StatelessWidget {
  final String imageUrl;
final Rocket rocket;
  const RocketListItem({super.key, required this.imageUrl, required this.rocket});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.rocketDetails,arguments: rocket);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadiusDirectional.circular(16),
          child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.network(
                imageUrl,
                fit: BoxFit.fill,
              )),
        ),
      ),
    );
  }
}
