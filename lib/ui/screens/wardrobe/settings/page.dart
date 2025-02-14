import 'package:flutter/material.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

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
            ListTile(
              
              title: const Text('Account'),
              onTap: () {
                // Navigate to account settings
                Navigator.pushNamed(context, '/settings/account');
              },
            ),
            ListTile(
              title: const Text('Notifications'),
              onTap: () {
                // Navigate to notification settings
                Navigator.pushNamed(context, '/settings/notifications');
              },
            ),
            ListTile(
              title: const Text('Privacy'),
              onTap: () {
                // Navigate to privacy settings
                Navigator.pushNamed(context, '/settings/privacy');
              },
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {
                // Navigate to about page
                Navigator.pushNamed(context, '/settings/about');
              },
            ),
          ],
        ),
      ),
    );
  }
}
