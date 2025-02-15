import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openwardrobe/repositories/app_repository.dart';
import 'package:openwardrobe/brick/models/user_profile.model.dart';

class SettingsAccountController extends StateNotifier<UserProfile?> {
  final AppRepository _appRepository;

  SettingsAccountController(this._appRepository) : super(null);

  UserProfile? get userProfile => state;

  Future<void> fetchUserProfile() async {
    final profiles = await _appRepository.get<UserProfile>();
    if (profiles.isNotEmpty) {
      state = profiles.first;
    }
  }

  Future<void> updateUserProfile(UserProfile updatedProfile) async {
    await _appRepository.upsert<UserProfile>(updatedProfile);
    state = updatedProfile; // Directly update state without using separate variables
  }
}

final settingsAccountControllerProvider =
    StateNotifierProvider<SettingsAccountController, UserProfile?>(
  (ref) => SettingsAccountController(ref.read(appRepositoryProvider)),
);