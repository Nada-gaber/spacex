import 'package:flutter/material.dart';
import 'package:spacex/features/login/ui/widgets/login_screen_body.dart';

import '../../../core/constant/images.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  MyImages.authBackground,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const LoginScreenBody(),
        ],
      ),
    );
  }
}
