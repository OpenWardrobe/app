import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:openwardrobe/brick/models/lookbook.model.dart';
import 'package:openwardrobe/ui/screens/camera/page.dart';
import 'package:openwardrobe/ui/screens/lookbook/page.dart';
import 'package:openwardrobe/ui/screens/wardrobe/settings/page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../ui/screens/auth/page.dart';
import '../ui/screens/home/page.dart';
import '../ui/screens/wardrobe/page.dart';
import '../ui/screens/wardrobe/add/page.dart';
import '../ui/widgets/scaffold_with_navbar.dart';
import 'package:openwardrobe/di/service_locator.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    redirect: (BuildContext context, GoRouterState state) {
      final session = Supabase.instance.client.auth.currentSession;
      final isLoggedIn = session != null;
      final isLoggingIn = state.uri.toString() == '/auth';

      if (!isLoggedIn && !isLoggingIn) {
        return '/auth';
      } else if (isLoggedIn && isLoggingIn) {
        return '/';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/auth',
        name: 'Auth',
        builder: (context, state) => const AuthScreen(),
      ),
      GoRoute(
        path: '/camera',
        name: 'Add Item',
        builder: (context, state) => const CameraScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                name: 'Home',
                builder: (context, state) => HomeScreen(),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/wardrobe',
                name: 'Wardrobe',
                builder: (context, state) => WardrobeScreen(),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/lookbook',
                name: 'Lookbook',
                builder: (context, state) => LookbookScreen(),
              ),
            ],
          ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              name: 'Settings',
              builder: (context, state) => const SettingsPage(),
            ),
          ],
        ),
        ],
      ),
    ],
  );
}
