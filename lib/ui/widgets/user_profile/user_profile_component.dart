import 'package:flutter/material.dart';
import 'package:openwardrobe/brick/models/user_profile.model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserProfileComponent extends StatelessWidget {
  final UserProfile item;

  const UserProfileComponent({super.key, required this.item});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: item.avatarUrl != null 
            ? NetworkImage(item.avatarUrl!)
            : null,
          child: item.avatarUrl == null 
            ? const Icon(Icons.person, size: 50)
            : null,
        ),
        const SizedBox(height: 16),
        
        Container(
          padding: EdgeInsets.all(10),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
          item.displayName ?? item.username,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        
        if (item.displayName != null) ...[
          Text(
            '@${item.username}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
        ],

        if (item.bio != null) ...[
          Text(
            item.bio!,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
        ],
        
        // Social links
        if (item.socialLinks != null)
          Wrap(
            spacing: 8,
            children: item.socialLinks!.entries.map((entry) {
              return Chip(
                label: Text(entry.key),
                avatar: const Icon(Icons.link),
              );
            }).toList(),
          ),
          ],
        ),
        )
        
        
      ],
    )
    );
  }
}