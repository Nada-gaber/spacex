import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenUrlInBrowserIconButton extends StatelessWidget {
  final String urlString;
  final double? iconSize;

  const OpenUrlInBrowserIconButton({
    super.key,
    required this.urlString,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Uri url = Uri.parse(urlString);
        try {
          launchUrl(url);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('There was an error, try again later'),
            ),
          );
        }
      },
      icon: Icon(
        Icons.info_outline,
        size: iconSize ?? 28,
      ),
    );
  }
}
