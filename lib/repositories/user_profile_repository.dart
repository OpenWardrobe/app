import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hive/hive.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../models/user_profile.dart';

class UserProfileRepository {
  final SupabaseClient supabaseClient = Supabase.instance.client;

  Future<UserProfile?> fetchUserProfile() async {
    final isOnline = await _checkConnectivity();
    final userId = supabaseClient.auth.currentUser?.id;

    if (userId == null) return null;

    if (isOnline) {
      try {
        final response = await supabaseClient
            .from('user_profiles')
            .select()
            .eq('id', userId)
            .single();
        final userProfile = UserProfile.fromJson(response);
        
        await _cacheProfileLocally(userProfile);
        return userProfile;
      } catch (error) {
        print('Error fetching profile: $error');
        return await _fetchProfileFromLocal();
      }
    } else {
      return await _fetchProfileFromLocal();
    }
  }

  // Update user profile
  Future<void> updateUserProfile(UserProfile profile) async {
    final isOnline = await _checkConnectivity();
    if (isOnline) {
      await supabaseClient
          .from('user_profiles')
          .upsert(profile.toJson())
          .select();
    } else {
      await _saveProfileLocally(profile);
    }
  }

  // Cache profile locally
  Future<void> _cacheProfileLocally(UserProfile profile) async {
    final box = await Hive.openBox<UserProfile>('user_profiles');
    await box.put(profile.id, profile);
  }

  // Fetch profile from local storage
  Future<UserProfile?> _fetchProfileFromLocal() async {
    final box = await Hive.openBox<UserProfile>('user_profiles');
    return box.values.isNotEmpty ? box.values.first : null;
  }

  // Check network connectivity
  Future<bool> _checkConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult[0] != ConnectivityResult.none;
  }

  // Save profile locally when offline
  Future<void> _saveProfileLocally(UserProfile profile) async {
    final box = await Hive.openBox<UserProfile>('user_profiles');
    await box.put(profile.id, profile);
  }
}