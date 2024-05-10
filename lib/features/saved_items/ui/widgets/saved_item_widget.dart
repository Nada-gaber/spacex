import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/utils/database_helper.dart';
import 'package:spacex/features/saved_items/logic/cubits/saved_items_cubit.dart';

import '../../../../core/constant/colors.dart';

class SavedItemWidget extends StatelessWidget {
  final int id;
  final String title;
  final String type;
  final String imageUrl;
  final String country;

  const SavedItemWidget(
      {super.key,
      required this.title,
      required this.type,
      required this.imageUrl,
      required this.country,
      required this.id});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsetsDirectional.all(8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadiusDirectional.all(Radius.circular(16)),
        border: Border.all(
          color: Colors.blue,
          width: .5
        )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusDirectional.circular(16),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.fill,
              width: screenWidth / 3.5,
              height: screenWidth / 2.8,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type,
                  style: TextStyle(
                    fontSize: screenWidth / 20,
                    fontWeight: FontWeight.w100,
                    color: Colors.lightBlue,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: screenWidth / 20, fontWeight: FontWeight.w500),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  country,
                  style: TextStyle(
                    color: AppColors.blueGray,
                    fontSize: screenWidth / 24,
                    fontWeight: FontWeight.w300,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                DataBaseHelper().delete(title);
                BlocProvider.of<SavedItemsCubit>(context).getSavedItems();
              },
              icon: const Icon(
                Icons.close,
                size: 35,
                color: Colors.red,
              ))
        ],
      ),
    );
  }
}
