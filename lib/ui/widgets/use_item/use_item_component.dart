import 'package:flutter/material.dart';
import 'package:openwardrobe/brick/models/use_item.model.dart';

class UseItemComponent extends StatelessWidget {
  final UseItem item;

  const UseItemComponent({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Used At: ${item.usedAt}',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            'Wardrobe Item: ${item.wardrobeItem.id}',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          if (item.userProfile != null)
            Text(
              'User: ${item.userProfile!.username}',
              style: const TextStyle(fontSize: 16),
            ),
        ],
      ),
    );
  }
}
