import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openwardrobe/controllers/settings_account_controller.dart';
import 'package:openwardrobe/brick/models/user_profile.model.dart';

class SettingsAccountPage extends StatefulWidget {
  const SettingsAccountPage({Key? key}) : super(key: key);

  @override
  _SettingsAccountPageState createState() => _SettingsAccountPageState();
}

class _SettingsAccountPageState extends State<SettingsAccountPage> {
  late SettingsAccountController _controller;
  late Future<UserProfile> _userProfileFuture;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _displayNameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  String? _avatarUrl;

  @override
  void initState() {
    super.initState();
    _controller = context.read(settingsAccountControllerProvider);
    _userProfileFuture = _controller.fetchUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Settings'),
      ),
      body: FutureBuilder<UserProfile>(
        future: _userProfileFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No profile found'));
          }

          final userProfile = snapshot.data!;
          _usernameController.text = userProfile.username;
          _displayNameController.text = userProfile.displayName ?? '';
          _bioController.text = userProfile.bio ?? '';
          _avatarUrl = userProfile.avatarUrl;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      final imageFile = await _controller.pickImage(fromGallery: true);
                      if (imageFile != null) {
                        final avatarUrl = await _controller.uploadAvatar(imageFile);
                        setState(() {
                          _avatarUrl = avatarUrl;
                        });
                      }
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: _avatarUrl != null ? NetworkImage(_avatarUrl!) : null,
                      child: _avatarUrl == null ? const Icon(Icons.person, size: 50) : null,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(labelText: 'Username'),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _displayNameController,
                  decoration: const InputDecoration(labelText: 'Display Name'),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _bioController,
                  decoration: const InputDecoration(labelText: 'Bio'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    final updatedProfile = UserProfile(
                      id: userProfile.id,
                      username: _usernameController.text,
                      displayName: _displayNameController.text,
                      bio: _bioController.text,
                      avatarUrl: _avatarUrl,
                      socialLinks: userProfile.socialLinks,
                      isPublic: userProfile.isPublic,
                      createdAt: userProfile.createdAt,
                      updatedAt: DateTime.now(),
                    );
                    await _controller.upsertUserProfile(updatedProfile);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Profile updated successfully')),
                    );
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
