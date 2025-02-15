import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:openwardrobe/brick/models/user_profile.model.dart';
import 'package:openwardrobe/repositories/app_repository.dart';

class HomeController extends ChangeNotifier {
  final AppRepository _appRepository = GetIt.instance<AppRepository>();

  UserProfile? _userProfile;
  UserProfile? get userProfile => _userProfile;

  Future<void> fetchUserProfile() async {
    try {
      final profiles = await _appRepository.get<UserProfile>();
      if (profiles.isNotEmpty) {
        _userProfile = profiles.first;
        notifyListeners();
      }
    } catch (e) {
      // Handle error
      print('Error fetching user profile: $e');
    }
  }

  void handleAddItems(BuildContext context) {
    Navigator.pushNamed(context, '/camera');
  }

  void handleCreateOutfit() {
    // Handle create outfit logic
  }

  void handleScheduleOutfit() {
    // Handle schedule outfit logic
  }

  void handleViewStats() {
    // Handle view stats logic
  }
}
