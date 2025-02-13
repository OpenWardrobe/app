import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:openwardrobe/ui/screens/wardrobe/item/add/page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../ui/screens/auth/page.dart';
import '../ui/screens/home/page.dart';
import '../ui/screens/wardrobe/page.dart';
import '../ui/screens/wardrobe/settings/page.dart';
import '../ui/screens/wardrobe/item/page.dart';
import '../ui/widgets/scaffold_with_navbar.dart';

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
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/wardrobe',
                name: 'Wardrobe',
                builder: (context, state) => const ProfileScreen(),
                routes: [
                  // Add
                  GoRoute(
                    path: '/add',
                    name: 'AddItem',
                    builder: (context, state) => const CreateItemPage(),
                  ),
                  GoRoute(
                    path: '/item/:id',
                    name: 'WardrobeItem',
                    builder: (context, state) {
                      final id = state.pathParameters['id']!;
                      return WardrobeItemPage(id: id);
                    },
                  ),
                ],
              ),
            ],
          ),
          
              
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/settings',
                name: 'Settings',
                builder: (context, state) => SettingsPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}