import 'package:flutter/material.dart';
import 'package:openwardrobe/brick/models/use_outfit.model.dart';

class UseOutfitComponent extends StatelessWidget {
  final UseOutfit item;

  const UseOutfitComponent({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Outfit: ${item.outfit.name}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Used at: ${item.usedAt}',
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
