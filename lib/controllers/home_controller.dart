import 'package:get_it/get_it.dart';
import 'package:openwardrobe/repositories/app_repository.dart';
import 'package:openwardrobe/brick/models/user_profile.model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class HomeController {
  final AppRepository _appRepository = GetIt.instance<AppRepository>();



  Stream<List<UserProfile>> fetchUserProfile() {
      final usersStream = _appRepository.subscribe<UserProfile>();

      return usersStream;
    
  }

}
