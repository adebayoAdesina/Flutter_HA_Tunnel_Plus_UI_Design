import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Color/colors.dart';
import '../Widget/info.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  static const _terms = [
    (
      '1. About this app',
      'HA Tunnel Plus is a UI design project built with Flutter. It shows how '
          'a tunneling app could look and feel, but it does not create real '
          'tunnels, VPN connections or proxies.',
    ),
    (
      '2. No warranty',
      'This project is provided "as is" for learning and portfolio purposes. '
          'Nothing here guarantees connection stability, server availability '
          'or fitness for any particular use.',
    ),
    (
      '3. Privacy',
      'The app does not collect, store or send personal data. Your theme '
          'choice is saved only on your device.',
    ),
    (
      '4. Open source',
      'The source code is released under the MIT License. You are free to '
          'use, modify and share it, as long as the license notice is kept.',
    ),
  ];

  Future<void> _openGithub() =>
      launchUrl(Uri.parse(githubUrl), mode: LaunchMode.externalApplication);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final light = theme.brightness == Brightness.light;
    final textColor = light ? Colors.black87 : Colors.white.withValues(alpha: 0.9);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: drawerColor,
        foregroundColor: Colors.white,
        title: const Text('About'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: light ? Colors.white : backGroundColor,
              boxShadow: light
                  ? [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.15),
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ]
                  : null,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Terms of Use',
                    style: TextStyle(
                      color: drawerColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'By using this app, you agree to the points below.',
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                for (final (title, body) in _terms) ...[
                  const SizedBox(height: 16),
                  Text(
                    title,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(body, style: TextStyle(color: textColor)),
                ],
              ],
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: Text(
              'Contribute',
              style: TextStyle(
                color: light ? Colors.black : Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Center(
            child: Text(
              'Send suggestions, bug reports and pull requests on GitHub.',
              textAlign: TextAlign.center,
              style: TextStyle(color: textColor),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: TextButton.icon(
              onPressed: _openGithub,
              icon: const Icon(Icons.code, color: drawerColor),
              label: const Text(
                'github.com/adebayoAdesina',
                style: TextStyle(
                  color: drawerColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              version,
              style: TextStyle(color: textColor.withValues(alpha: 0.6)),
            ),
          ),
        ],
      ),
    );
  }
}
