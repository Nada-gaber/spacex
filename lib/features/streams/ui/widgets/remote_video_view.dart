import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:spacex/core/themes/text_styles.dart';

class RemoteVideoView extends StatelessWidget {
  const RemoteVideoView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(19),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue.shade900,
          ),
          height: 70,
          child: const Center(
            child: Text(
              'No one in this channel yet',
              textAlign: TextAlign.center,
              style: MyTextStyles.font18White60W600,
            ),
          ),
        ),
      ),
    );
  }
}
