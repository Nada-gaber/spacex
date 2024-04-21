import 'package:flutter/material.dart';

detailImageContainer(BuildContext context, String shipImage) {
  return Center(
    child: Container(
      height: 250,
      width: MediaQuery.of(context).size.width - 20,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
          ),
          image: DecorationImage(
            image: AssetImage(shipImage),
            fit: BoxFit.fitWidth,
          )),
    ),
  );
}
