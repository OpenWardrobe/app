import 'package:flutter/material.dart';
import 'package:openwardrobe/models/user_profile.dart';
import 'package:openwardrobe/services/user_profile_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:openwardrobe/repositories/user_profile_repository.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({super.key});

  final UserProfileService userProfileService = UserProfileService(UserProfileRepository());

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _usernameController;
  late TextEditingController _displayNameController;
  late TextEditingController _bioController;
  bool _isPublic = true;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _displayNameController = TextEditingController();
    _bioController = TextEditingController();
    _loadUserProfile();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _displayNameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  Future<void> _loadUserProfile() async {
    final profile = await widget.userProfileService.getUserProfile();
    if (profile != null) {
      setState(() {
        _usernameController.text = profile.username;
        _displayNameController.text = profile.displayName ?? '';
        _bioController.text = profile.bio ?? '';
        _isPublic = profile.isPublic;
      });
    }
  }

  Future<void> _saveUserProfile() async {
    final userId = Supabase.instance.client.auth.currentUser?.id;
    if (userId == null) return;

    final profile = UserProfile(
      id: userId,
      username: _usernameController.text,
      displayName: _displayNameController.text,
      bio: _bioController.text,
      isPublic: _isPublic,
    );

    final success = await widget.userProfileService.updateUserProfile(profile);
    final message = success ? 'Settings saved successfully!' : 'Error saving settings.';

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
                validator: (value) => value!.isEmpty ? 'Enter a username' : null,
              ),
              TextFormField(
                controller: _displayNameController,
                decoration: InputDecoration(labelText: 'Display Name'),
              ),
              TextFormField(
                controller: _bioController,
                decoration: InputDecoration(labelText: 'Bio'),
              ),
              SwitchListTile(
                title: Text('Public Profile'),
                value: _isPublic,
                onChanged: (value) => setState(() => _isPublic = value),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _saveUserProfile();
                  }
                },
                child: Text('Save Settings'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}