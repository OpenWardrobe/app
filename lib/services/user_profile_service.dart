import '../models/user_profile.dart';
import '../repositories/user_profile_repository.dart';

class UserProfileService {
  final UserProfileRepository _repository;

  UserProfileService(this._repository);

  // Get user profile (fetch from Supabase or local storage)
  Future<UserProfile?> getUserProfile() async {
    try {
      return await _repository.fetchUserProfile();
    } catch (e) {
      print('Error getting user profile: $e');
      return null;
    }
  }

  // Update user profile
  Future<bool> updateUserProfile(UserProfile profile) async {
    try {
      await _repository.updateUserProfile(profile);
      return true;
    } catch (e) {
      print('Error updating user profile: $e');
      return false;
    }
  }

  // Check if profile exists (for onboarding or first-time setup)
  Future<bool> doesProfileExist() async {
    final profile = await _repository.fetchUserProfile();
    return profile != null;
  }
}
