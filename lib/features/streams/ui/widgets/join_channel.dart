import 'package:flutter/material.dart';

class JoinChannelButton extends StatelessWidget {
  final void Function()? onPressed;
  const JoinChannelButton({super.key,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  Positioned(
            top: 50.0,
            right: 20.0,
            child: ElevatedButton(
              onPressed:onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade900,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Join Channel',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
  }
}