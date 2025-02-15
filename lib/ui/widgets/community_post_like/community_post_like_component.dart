import 'package:flutter/material.dart';
import 'package:openwardrobe/brick/models/community_post_like.model.dart';
import 'package:openwardrobe/ui/widgets/user_profile/user_profile_component.dart';

class CommunityPostLikeComponent extends StatelessWidget {
  final CommunityPostLike like;

  const CommunityPostLikeComponent({super.key, required this.like});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (like.userProfile != null)
            UserProfileComponent(item: like.userProfile!),
        ],
      ),
    );
  }
}
