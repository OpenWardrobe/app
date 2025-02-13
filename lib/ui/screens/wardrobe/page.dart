import 'package:flutter/material.dart';
import 'package:openwardrobe/models/user_profile.dart';
import 'package:openwardrobe/repositories/user_profile_repository.dart';
import 'package:openwardrobe/services/user_profile_service.dart';
import 'package:openwardrobe/services/wardrobe_service.dart';
import 'package:openwardrobe/repositories/wardrobe_repository.dart';
import 'package:openwardrobe/models/wardrobe_item.dart';
import 'package:openwardrobe/ui/widgets/wardrobe/item.dart';
import 'package:openwardrobe/ui/widgets/wardrobe/category.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<UserProfile?> _fetchUserProfile() async {
    final userService = UserProfileService(UserProfileRepository());
    return await userService.getUserProfile();
  }

  Future<List<WardrobeItem>> _fetchPublicItems(String userId) async {
    final wardrobeService = WardrobeService(WardrobeRepository());
    return await wardrobeService.fetchPublicItemsByUser(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: FutureBuilder<UserProfile?>(
        future: _fetchUserProfile(),
        builder: (context, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (userSnapshot.hasError) {
            return Center(child: Text('Error: ${userSnapshot.error}'));
          } else if (userSnapshot.hasData) {
            final user = userSnapshot.data;
            return _buildProfileWithItems(context, user);
          } else {
            return const Center(child: Text('No profile data available'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildProfileWithItems(BuildContext context, UserProfile? user) {
    return Column(
      children: [
        _buildProfileCard(context, user),
        if (user != null) _buildTabBar(context, user),
      ],
    );
  }

  Widget _buildProfileCard(BuildContext context, UserProfile? user) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            user?.displayName ?? 'No display name',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Text(
            "@${user?.username}",
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: Colors.grey.shade600),
          ),
          Text(
            user?.bio ?? 'No bio available',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar(BuildContext context, UserProfile user) {
    return Expanded(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.public),
                  text: 'Items',
                ),
                Tab(
                  icon: Icon(Icons.style),
                  text: 'Outfits',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildPublicItemsList(context, user.id),
                  const Center(child: Text('Empty tab')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPublicItemsList(BuildContext context, String userId) {
    return FutureBuilder<List<WardrobeItem>>(
      future: _fetchPublicItems(userId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error loading items: ${snapshot.error}'));
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 400,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WarderobeCategory(
                        text: 'All Items',
                        image: const Image(
                          image: NetworkImage('https://picsum.photos/200/300'),
                        ),
                        isSelected: true,
                        onTap: () {
                          // Handle tap
                        },
                      ),
                      WarderobeCategory(
                        text: 'Tops',
                        image: const Image(
                          image: NetworkImage('https://picsum.photos/200/300'),
                        ),
                        isSelected: false,
                        onTap: () {
                          // Handle tap
                        },
                      ),
                      WarderobeCategory(
                        text: 'Bottoms',
                        image: const Image(
                          image: NetworkImage('https://picsum.photos/200/300'),
                        ),
                        isSelected: false,
                        onTap: () {
                          // Handle tap
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: snapshot.data!.map((item) {
                    return WardrobeItemCard(
                      item: item,
                      onTap: () {
                        // Handle item tap
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: Text('No public items available.'));
        }
      },
    );
  }
}