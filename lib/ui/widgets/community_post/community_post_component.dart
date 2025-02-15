import 'package:flutter/material.dart';
import 'package:openwardrobe/brick/models/community_post.model.dart';
import 'package:openwardrobe/ui/widgets/user_profile/user_profile_component.dart';

class CommunityPostComponent extends StatelessWidget {
  final CommunityPost post;

  const CommunityPostComponent({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (post.userProfile != null)
            UserProfileComponent(item: post.userProfile!),
          const SizedBox(height: 8),
          Text(
            post.content,
            style: const TextStyle(fontSize: 16),
          ),
          if (post.imageUrl != null)
            Image.network(post.imageUrl!),
        ],
      ),
    );
  }
}
