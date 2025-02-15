import 'package:get_it/get_it.dart';
import 'package:openwardrobe/repositories/app_repository.dart';
import 'package:openwardrobe/brick/models/user_profile.model.dart';

class HomeController {
  final AppRepository _appRepository = GetIt.instance<AppRepository>();

  Future<UserProfile> fetchUserProfile() async {
    try {
      final profiles = await _appRepository.get<UserProfile>();
      return profiles.first;
    } catch (e) {
      throw Exception('Failed to fetch user profile: $e');
    }
  }

  Future<List<DashboardLink>> fetchDashboardLinks() async {
    try {
      // Implement logic to fetch dashboard links
      // Example: return await _appRepository.get<DashboardLink>();
      return [];
    } catch (e) {
      throw Exception('Failed to fetch dashboard links: $e');
    }
  }
}
