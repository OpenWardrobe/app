import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Settings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text('Account'),
              onTap: () {
                // Navigate to account settings
              },
            ),
            ListTile(
              title: const Text('Notifications'),
              onTap: () {
                // Navigate to notification settings
              },
            ),
            ListTile(
              title: const Text('Privacy'),
              onTap: () {
                // Navigate to privacy settings
              },
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {
                // Navigate to about page
              },
            ),
          ],
        ),
      ),
    );
  }
}
