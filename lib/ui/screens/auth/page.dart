import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:openwardrobe/controllers/auth_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = AuthController();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Logo and other UI elements can be added here
                SupaEmailAuth(
                  redirectTo: '/',
                  onSignInComplete: (AuthResponse response) async {
                    try {
                      final signInResponse = await authController.signIn(
                        response.user!.email!,
                        response.user!.password!,
                      );
                      if (signInResponse.session != null) {
                        context.go('/');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Login failed. Please try again.')),
                        );
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: $e')),
                      );
                    }
                  },
                  onSignUpComplete: (AuthResponse response) async {
                    try {
                      final signUpResponse = await authController.signUp(
                        response.user!.email!,
                        response.user!.password!,
                        {'username': response.user!.userMetadata!['username']},
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Sign up successful! Please sign in.')),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: $e')),
                      );
                    }
                  },
                  metadataFields: [
                    MetaDataField(
                      prefixIcon: const Icon(Icons.person),
                      label: 'Username',
                      key: 'username',
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
