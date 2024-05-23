import 'package:flutter/material.dart';
import 'package:spacex/features/register/ui/widgets/register_screen_body.dart';

import '../../../core/constant/images.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
          const RegisterScreenBody(),
        ],
      ),
    );
  }
}
