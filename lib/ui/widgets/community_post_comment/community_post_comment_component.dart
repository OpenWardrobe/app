import 'package:flutter/material.dart';
import 'package:openwardrobe/brick/models/community_post_comment.model.dart';
import 'package:openwardrobe/ui/widgets/user_profile/user_profile_component.dart';

class CommunityPostCommentComponent extends StatelessWidget {
  final CommunityPostComment comment;

  const CommunityPostCommentComponent({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (comment.userProfile != null)
            UserProfileComponent(item: comment.userProfile!),
          const SizedBox(height: 8),
          Text(
            comment.comment,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
