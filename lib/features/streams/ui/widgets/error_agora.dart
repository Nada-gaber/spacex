import 'package:flutter/material.dart';
import 'package:spacex/core/constant/colors.dart';

/// This widget is used to indicate the configuration is invalid
class InvalidConfigWidget extends StatelessWidget {
  /// Construct the [InvalidConfigWidget]
  const InvalidConfigWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundDarkBlue,
      body: Center(
        child: Text(
          'Check Your Connection',
          style: TextStyle(color: AppColors.textWhite),
        ),
      ),
    );
  }
}
