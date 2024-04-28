import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenUrlInBrowserIconButton extends StatelessWidget {
  final String urlString;

  const OpenUrlInBrowserIconButton({super.key, required this.urlString});

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
        icon: const Icon(
          Icons.info_outline,
          size: 28,
        ));
  }
}
