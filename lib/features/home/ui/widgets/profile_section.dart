import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsetsDirectional.symmetric(vertical: screenHeight / 20),
      child: Column(
        children: [
          Container(
            height: screenHeight / 9.5,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient:
                    LinearGradient(colors: [Colors.white, Colors.blueGrey])),
            child: CircleAvatar(
              radius: screenWidth / 9.5,
              backgroundImage: const NetworkImage(
                  "https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            "Mahmoud Alaa",
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
          const Text(
            "mahmoud.alaa1212@gmail.com",
            style: TextStyle(color: Colors.grey, fontSize: 16.0),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
