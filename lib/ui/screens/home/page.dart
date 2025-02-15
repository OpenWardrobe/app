import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openwardrobe/brick/models/user_profile.model.dart';
import 'package:openwardrobe/controllers/home_controller.dart';
import 'package:openwardrobe/ui/widgets/dashboard/link.dart';
import 'package:openwardrobe/ui/widgets/user_profile/user_profile_component.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeController = ref.read(homeControllerProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: SingleChildScrollView(
            child: Align(
          alignment: Alignment.topCenter,
          child: IntrinsicHeight(
            child: Column(
              children: [
                const SizedBox(height: 20),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: FutureBuilder<UserProfile>(
                    future: homeController.fetchUserProfile(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData) {
                        return const Center(child: Text('No profile found'));
                      }
                      return UserProfileComponent(item: snapshot.data!);
                    },
                  ),
                ),
                const SizedBox(height: 20),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DashboardLink(
                        text: 'Add Items',
                        icon: Icons.add,
                        color: Colors.blue,
                        onTap: () => context.push("/camera"),
                      ),
                      DashboardLink(
                        text: 'Create Outfit',
                        color: Colors.red,
                        icon: Icons.list,
                        onTap: () {},
                      ),
                      DashboardLink(
                        text: 'Schedule Outfit',
                        color: Colors.green,
                        icon: Icons.calendar_today,
                        onTap: () {},
                      ),
                      DashboardLink(
                        text: 'View Stats',
                        color: Colors.purple,
                        icon: Icons.bar_chart,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                
              ],
            ),
          ),
        )
      )

    );
  }
}
