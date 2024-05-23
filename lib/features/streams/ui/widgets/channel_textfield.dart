import 'package:flutter/material.dart';
import 'package:spacex/core/constant/colors.dart';

class ChannelNameTextField extends StatelessWidget {
 final TextEditingController textEditingController;
   const ChannelNameTextField({super.key,required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Align(
              alignment: Alignment.center,
              child: TextField(
                controller:textEditingController,
                decoration: InputDecoration(
                  label: const Text('Channel Name'),
                  hintText: 'Enter Channel Name',
                  filled: true,
                  fillColor: AppColors.backgroundDarkBlue,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
                ),
              ),
            ),
          );
  }
}