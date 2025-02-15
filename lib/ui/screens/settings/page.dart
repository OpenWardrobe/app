import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
                context.push('/settings/account');
              },
            ),
            ListTile(
              title: const Text('Notifications'),
              onTap: () {
                Navigator.pushNamed(context, '/settings/notifications');
              },
            ),
            ListTile(
              title: const Text('Privacy'),
              onTap: () {
                Navigator.pushNamed(context, '/settings/privacy');
              },
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {
                Navigator.pushNamed(context, '/settings/about');
              },
            ),
          ],
        ),
      ),
    );
  }
}
