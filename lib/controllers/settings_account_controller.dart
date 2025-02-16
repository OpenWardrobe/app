import 'dart:io';
import 'package:flutter/foundation.dart' show Uint8List, kIsWeb;
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:openwardrobe/brick/models/user_profile.model.dart';
import 'package:openwardrobe/repositories/app_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SettingsAccountController {
  final AppRepository _appRepository = GetIt.instance<AppRepository>();

  Future<UserProfile> fetchUserProfile() async {
    try {
      final profiles = await _appRepository.get<UserProfile>();
      return profiles.first;
    } catch (e) {
      throw Exception('Failed to fetch user profile: $e');
    }
  }

  Future<void> upsertUserProfile(UserProfile profile) async {
    try {
      await _appRepository.upsert<UserProfile>(profile);
    } catch (e) {
      throw Exception('Failed to upsert user profile: $e');
    }
  }

  Future<String> uploadAvatar(File imageFile) async {
    try {
      final response = await Supabase.instance.client.storage
          .from('avatars')
          .upload(imageFile.path, imageFile);
      return response;
    } catch (e) {
      throw Exception('Failed to upload avatar: $e');
    }
  }

  Future<String> uploadWebAvatar(Uint8List imageBytes, String fileName) async {
    try {
      final response = await Supabase.instance.client.storage
          .from('avatars')
          .uploadBinary(fileName, imageBytes);
      return response;
    } catch (e) {
      throw Exception('Failed to upload web avatar: $e');
    }
  }

  Future<File?> pickImage({bool fromGallery = false}) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: fromGallery ? ImageSource.gallery : ImageSource.camera,
    );

    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return null;
    }
  }

  Future<Uint8List?> pickWebImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      return await pickedFile.readAsBytes();
    } else {
      return null;
    }
  }
}
