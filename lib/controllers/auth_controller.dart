import 'package:get_it/get_it.dart';
import 'package:openwardrobe/repositories/app_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController {
  final AppRepository _appRepository = GetIt.instance<AppRepository>();

  Future<AuthResponse> signIn(String email, String password) async {
    try {
      final response = await _appRepository.supabaseProvider.client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return response;
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }

  Future<AuthResponse> signUp(String email, String password, Map<String, dynamic> metadata) async {
    try {
      final response = await _appRepository.supabaseProvider.client.auth.signUp(
        email: email,
        password: password,
        options: AuthOptions(
          data: metadata,
        ),
      );
      return response;
    } catch (e) {
      throw Exception('Failed to sign up: $e');
    }
  }
}
