import 'package:flutter/material.dart';
import 'package:openwardrobe/brick/models/outfit_item.model.dart';

class OutfitItemComponent extends StatelessWidget {
  final OutfitItem item;

  const OutfitItemComponent({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.outfit.name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            item.wardrobeItem.imagePath,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
