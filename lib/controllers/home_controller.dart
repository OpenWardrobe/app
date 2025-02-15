import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openwardrobe/repositories/app_repository.dart';
import 'package:openwardrobe/brick/models/user_profile.model.dart';

final homeControllerProvider = Provider((ref) => HomeController(ref.read));

class HomeController {
  final AppRepository _appRepository;

  HomeController(Reader read) : _appRepository = read(appRepositoryProvider);

  Future<UserProfile> fetchUserProfile() async {
    try {
      final profiles = await _appRepository.get<UserProfile>();
      return profiles.first;
    } catch (e) {
      throw Exception('Failed to fetch user profile: $e');
    }
  }
}
