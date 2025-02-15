import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openwardrobe/controllers/settings_controller.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsController = ref.read(settingsControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: settingsController.fetchSettings(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No settings found'));
          }

          final settings = snapshot.data!;

          return Padding(
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
          );
        },
      ),
    );
  }
}
