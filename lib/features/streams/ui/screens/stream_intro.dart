import 'package:flutter/material.dart';
import 'package:spacex/core/constant/colors.dart';
import 'package:spacex/core/constant/images.dart';
import 'package:spacex/core/routing/extensions.dart';
import 'package:spacex/core/routing/routes.dart';
import 'package:spacex/core/themes/text_styles.dart';

class StreamingIntroScreen extends StatefulWidget {
  const StreamingIntroScreen({super.key});

  @override
  State<StreamingIntroScreen> createState() => _StreamingIntroScreenState();
}

class _StreamingIntroScreenState extends State<StreamingIntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDarkBlue,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(MyImages.streaming),
              const SizedBox(height: 20),
              const Text('Want to Join SpaceX Comminuty ...',
                  textAlign: TextAlign.center,
                  style: MyTextStyles.font30WhiteBold),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.pushNamed(Routes.streamingScreen);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 56, 111, 207),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Join Us Now',
                  style: MyTextStyles.font16WhiteBold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
